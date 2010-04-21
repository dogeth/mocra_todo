class TodoItem < ActiveRecord::Base
	validates_presence_of :title
	has_many :todo_item_tags
	has_many :tags, :through => :todo_item_tags
end
