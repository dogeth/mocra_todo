class TodoItemsController < ApplicationController
	def index
		@todoItem = TodoItem.new
		@todoItems = TodoItem.all( :order => "created_at desc" )
	end
	
	def create
		@todoItem = TodoItem.new( params[ :todo_item ] )
		@todoItem.done = false
		if @todoItem.save
			redirect_to root_path
		else
			@todoItems = TodoItem.all( :order => "created_at desc" )
			render :action => "index"
		end
	end
	
	def destroy
		TodoItem.delete( params[ :id ] )
		redirect_to root_path
	end
end
