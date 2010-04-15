ActionController::Routing::Routes.draw do |map|
  map.resources :todo_items, :member => {
  		:done => :put, 
  		:undo => :put
  	}

  map.root :controller => "todo_items", :action => "index"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
