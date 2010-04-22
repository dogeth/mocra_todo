class Tag < ActiveRecord::Base
	validates_uniqueness_of :name
	has_many :todo_item_tags
	has_many :todo_items, :through => :todo_item_tags
end
