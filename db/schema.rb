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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150701234029) do

  create_table "areas", force: :cascade do |t|
    t.string "description", limit: 255
  end

  create_table "categories", force: :cascade do |t|
    t.text "description", limit: 65535
  end

  create_table "comments", force: :cascade do |t|
    t.text     "text",                limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",             limit: 4
    t.integer  "request_id",          limit: 4
    t.integer  "service_offering_id", limit: 4
  end

  create_table "communities", force: :cascade do |t|
    t.integer "request_id",           limit: 4
    t.integer "services_offering_id", limit: 4
  end

  create_table "events", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.text     "address",     limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "status",      limit: 255
  end

  create_table "experiences", force: :cascade do |t|
    t.string   "tittle",              limit: 255
    t.text     "description",         limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",             limit: 4
    t.integer  "request_id",          limit: 4
    t.integer  "service_offering_id", limit: 4
  end

  create_table "institutions", force: :cascade do |t|
    t.text     "description",       limit: 65535
    t.string   "name",              limit: 255
    t.text     "web",               limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "logo_file_name",    limit: 255
    t.string   "logo_content_type", limit: 255
    t.integer  "logo_file_size",    limit: 4
    t.datetime "logo_updated_at"
  end

  create_table "messages", force: :cascade do |t|
    t.string   "matters",    limit: 255
    t.text     "text",       limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",    limit: 4
  end

  create_table "messages_users", force: :cascade do |t|
    t.integer  "message_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages_users", ["message_id"], name: "index_messages_users_on_message_id", using: :btree
  add_index "messages_users", ["user_id"], name: "index_messages_users_on_user_id", using: :btree

  create_table "offerings", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.string   "status",      limit: 255
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "offerings", ["user_id"], name: "index_offerings_on_user_id", using: :btree

  create_table "requests", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.integer  "experience_id", limit: 4
    t.integer  "community_id",  limit: 4
    t.integer  "area_id",       limit: 4
    t.string   "title",         limit: 255
    t.text     "description",   limit: 65535
    t.string   "status",        limit: 255
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "order",      limit: 255
    t.text     "body",       limit: 65535
    t.string   "priority",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.integer  "institution_id",         limit: 4
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.string   "name",                   limit: 255
    t.string   "last_name",              limit: 255
    t.integer  "autorization_level",     limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category",               limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "offerings", "users"
end
