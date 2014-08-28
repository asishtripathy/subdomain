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

ActiveRecord::Schema.define(version: 20140828125932) do

  create_table "cart_items", force: true do |t|
    t.integer "cart_id"
    t.integer "product_id"
    t.integer "quantity"
  end

  create_table "carts", force: true do |t|
    t.string "session_id"
  end

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "domain"
    t.integer  "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company_users", force: true do |t|
    t.integer  "company_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", force: true do |t|
    t.string   "name"
    t.integer  "imagable_id"
    t.string   "imagable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.decimal  "price",      precision: 5, scale: 2, default: 0.0
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "role"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_facebook_tokens", force: true do |t|
    t.integer "user_id"
    t.string  "access_token"
    t.string  "email"
    t.string  "uid"
    t.string  "religion"
    t.string  "political"
  end

  create_table "user_products", force: true do |t|
    t.integer "user_id"
    t.integer "product_id"
  end

  create_table "user_twitter_tokens", force: true do |t|
    t.integer "user_id"
    t.string  "nickname"
    t.string  "token"
    t.string  "secret"
    t.string  "image"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "variants", force: true do |t|
    t.string   "variation"
    t.string   "value"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end