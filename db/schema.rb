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

ActiveRecord::Schema.define(version: 20140424061112) do

  create_table "product_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "size"
    t.float    "price"
    t.integer  "product_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status"
    t.string   "image_fb_url1"
    t.string   "image_fb_url2"
    t.string   "image_fb_url3"
    t.integer  "amount"
  end

  create_table "revenues", force: true do |t|
    t.string   "name"
    t.float    "amount"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spendings", force: true do |t|
    t.string   "name"
    t.float    "amount"
    t.string   "content"
    t.integer  "created_user_id"
    t.integer  "updated_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_revenues", force: true do |t|
    t.integer "user_id"
    t.integer "user_revenue_id"
    t.string  "status"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",            default: false
    t.string   "type"
    t.float    "amount"
    t.float    "balance"
  end

end
