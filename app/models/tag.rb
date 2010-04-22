class Tag < ActiveRecord::Base
	has_many :todo_item_tags
	has_many :todo_items, :through => :todo_item_tags
end
