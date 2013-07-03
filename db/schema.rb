# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130703103908) do

  create_table "carts", :force => true do |t|
    t.string   "user_id"
    t.string   "course_id"
    t.string   "order_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "session_id"
    t.string   "order_number"
  end

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "course_items", :force => true do |t|
    t.integer  "course_id"
    t.string   "question"
    t.string   "answer"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "audio_file_name"
    t.string   "audio_content_type"
    t.integer  "audio_file_size"
    t.datetime "audio_updated_at"
  end

  create_table "courses", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "briefing"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "due_at"
    t.float    "price"
    t.integer  "duration_days"
    t.integer  "group_id"
    t.integer  "category_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "unit"
    t.string   "serial"
  end

  create_table "groups", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "news", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "publish_at"
    t.datetime "close_at"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "key"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "site_configs", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "key"
    t.text     "value"
  end

  create_table "studies", :force => true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.integer  "progress_id"
    t.integer  "status"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.float    "score"
    t.date     "starts_at"
    t.date     "ends_at"
    t.integer  "passed"
    t.integer  "user_order_id"
  end

  create_table "user_orders", :force => true do |t|
    t.integer  "user_id"
    t.string   "order_number"
    t.integer  "payment_method"
    t.integer  "payment_status"
    t.float    "payment_price"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "courses"
  end

  create_table "user_profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "middlename"
    t.string   "id_number"
    t.date     "dob"
    t.integer  "gender"
    t.string   "education"
    t.string   "country"
    t.string   "state"
    t.string   "register_address"
    t.string   "address"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "cellphone"
    t.string   "phone"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
