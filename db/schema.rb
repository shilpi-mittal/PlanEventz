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

ActiveRecord::Schema.define(version: 20150608112426) do

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vendor_categories", force: :cascade do |t|
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vendor_reviews", force: :cascade do |t|
    t.integer  "vendor_id"
    t.integer  "user_id"
    t.text     "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "vendor_reviews", ["user_id"], name: "index_vendor_reviews_on_user_id"
  add_index "vendor_reviews", ["vendor_id"], name: "index_vendor_reviews_on_vendor_id"

  create_table "vendor_sub_categories", force: :cascade do |t|
    t.integer  "vendor_category_id"
    t.string   "sub_category"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "vendor_sub_categories", ["vendor_category_id"], name: "index_vendor_sub_categories_on_vendor_category_id"

  create_table "vendors", force: :cascade do |t|
    t.integer  "vendor_sub_category_id"
    t.string   "name"
    t.string   "location"
    t.text     "address"
    t.string   "phone"
    t.text     "description"
    t.string   "website"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "arrangements"
  end

  add_index "vendors", ["vendor_sub_category_id"], name: "index_vendors_on_vendor_sub_category_id"

end
