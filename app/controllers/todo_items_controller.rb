class TodoItemsController < ApplicationController
	def index
		@todoItem = TodoItem.new
		if params[:tags]
			@tag = Tag.find_by_name( params[ :tags ] )
			@todoItems = @tag.todo_items
		else
			@todoItems = TodoItem.all( :order => "created_at desc" )
		end
	end
	
	def create
		@todoItem = TodoItem.new( params[ :todo_item ] )
		@todoItem.done = false
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
	
	def done
		update_item{ @todo_item.done = true }
	end
	
	def undo
		update_item{ @todo_item.done = false }
	end

	private
		def update_item
			@todo_item = TodoItem.find( params[ :id ] )
			yield
			@todo_item.save!
			redirect_to root_path
		end
end
