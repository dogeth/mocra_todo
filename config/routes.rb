ActionController::Routing::Routes.draw do |map|
  map.resources :todo_items, :member => {
      :done => :post, 
      :undo => :post,
      :update_tags => :post
    }

  map.root :controller => "todo_items", :action => "index"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
