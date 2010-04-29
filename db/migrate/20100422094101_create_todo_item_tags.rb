class CreateTodoItemTags < ActiveRecord::Migration
  def self.up
    create_table :todo_item_tags do |t|
      t.integer :tag_id
      t.integer :todo_item_id

      t.timestamps
    end
    
    add_index :todo_item_tags, :tag_id
  add_index :todo_item_tags, :todo_item_id
  add_index :todo_item_tags, [:tag_id, :todo_item_id]
  end

  def self.down
    remove_index :todo_item_id, :column_name
    remove_index :todo_item_tags, :column_name
    drop_table :todo_item_tags    
  end
end
