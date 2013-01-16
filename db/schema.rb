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

ActiveRecord::Schema.define(:version => 20130110005748) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "meta_description"
    t.string   "title"
    t.string   "permalink"
    t.text     "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "lexique_id"
    t.datetime "validated_at"
    t.text     "content"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "comments", ["lexique_id"], :name => "comments_lexique_id_fk"
  add_index "comments", ["user_id"], :name => "comments_user_id_fk"
  add_index "comments", ["validated_at"], :name => "index_comments_on_validated_at"

  create_table "lexiques", :force => true do |t|
    t.string   "title"
    t.string   "permalink"
    t.string   "name"
    t.string   "short_description"
    t.string   "meta_description"
    t.text     "description"
    t.text     "keywords"
    t.datetime "published_at"
    t.text     "family"
    t.text     "synonyme"
    t.integer  "category_id"
    t.boolean  "courant",                         :default => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
    t.integer  "home_view",                       :default => 0
    t.string   "first_letter",       :limit => 1
  end

  add_index "lexiques", ["category_id"], :name => "lexiques_category_id_fk"
  add_index "lexiques", ["published_at"], :name => "index_lexiques_on_published_at"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "username"
    t.string   "provider"
    t.string   "name"
    t.string   "uid"
    t.string   "encrypted_password",     :default => "", :null => false
    t.boolean  "is_admin"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
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

  add_foreign_key "comments", "lexiques", :name => "comments_lexique_id_fk"
  add_foreign_key "comments", "users", :name => "comments_user_id_fk"

  add_foreign_key "lexiques", "categories", :name => "lexiques_category_id_fk"

end
