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

ActiveRecord::Schema.define(:version => 20100402182455) do

  create_table "photos", :force => true do |t|
    t.integer  "user_id"
    t.integer  "fb_user_id", :limit => 8
    t.integer  "fb_pid",     :limit => 8
    t.integer  "fb_aid",     :limit => 8
    t.string   "src_small"
    t.string   "src_big"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos_stories", :id => false, :force => true do |t|
    t.integer "photo_id"
    t.integer "story_id"
  end

  create_table "stories", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stories_users", :id => false, :force => true do |t|
    t.integer "story_id"
    t.integer "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.integer  "fb_user_id",                :limit => 8
    t.string   "email_hash"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
