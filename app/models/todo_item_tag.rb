class TodoItemTag < ActiveRecord::Base
	belongs_to :todo_item
	belongs_to :tags
end
