class TodoItemsController < ApplicationController
	before_filter :find_item, :only => [:done, :undo]
	
	def index
		@todoItem = TodoItem.new
		@todoItems = TodoItem.all( :order => "created_at desc" )
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
		@todo_item.done = true
		save_item
	end
	
	def undo
		@todo_item.done = false
		save_item
	end
	
	private
		def find_item
			@todo_item = TodoItem.find( params[ :id ] )
		end
		
	private
		def save_item
			@todo_item.save!
			redirect_to root_path
		end
end
