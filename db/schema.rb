# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100422094101) do

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "todo_item_tags", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "todo_item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "todo_item_tags", ["tag_id", "todo_item_id"], :name => "index_todo_item_tags_on_tag_id_and_todo_item_id"
  add_index "todo_item_tags", ["tag_id"], :name => "index_todo_item_tags_on_tag_id"
  add_index "todo_item_tags", ["todo_item_id"], :name => "index_todo_item_tags_on_todo_item_id"

  create_table "todo_items", :force => true do |t|
    t.string   "title"
    t.boolean  "done"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
