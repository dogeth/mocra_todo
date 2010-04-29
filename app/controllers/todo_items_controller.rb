class TodoItemsController < ApplicationController
  def index
    @tags = Tag.all
    if params[:tags] && @tag = Tag.find_by_name( params[ :tags ] )
      @todoItems = @tag.todo_items
    else
      @todoItems = TodoItem.all( :order => "created_at desc" )
    end
    @TodoItem = TodoItem.new

    respond_to do |wants|
      wants.html { }
      wants.js { render :json => @todoItems.to_json(:include => :tags) }
      wants.xml { render :xml => @todoItems.to_xml(:include => :tags) }
    end
  end
  
  def create
    @todoItem = TodoItem.new( params[ :todo_item ] )
    if params[ :tag ]      
      @tag = Tag.find( params[ :tag ] )
      @todoItem.tags << @tag
    end
      
    if @todoItem.save!
      redirect_to root_path
    else
      @todoItems = TodoItem.all( :order => "created_at desc" )
      render :action => "index"
    end
  end
  
  def destroy
    TodoItem.destroy params[ :id ] 
    redirect_to root_path
  end

  def show
    @todo_item = TodoItem.find( params[ :id ] )
    @todo_item_tag = TodoItemTag.new( :tag_id => @todo_item.id)
  end
  
  def done
    update_item{ @todo_item.done = true }
  end
  
  def undo
    update_item{ @todo_item.done = false }
  end

  def update_tags    
    update_item do
      tags = params[ :tags ].split(',').map{ |s| s.strip }.map{ |s| Tag.find_or_create_by_name( s ) }
      @todo_item.tags = tags
    end
  end

  private
    def update_item
      @todo_item = TodoItem.find( params[ :id ] )
      yield
      @todo_item.save!
      redirect_to  request.env['HTTP_REFERER']
    end
end
