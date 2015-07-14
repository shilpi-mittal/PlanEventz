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

ActiveRecord::Schema.define(version: 20150715183812) do

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "page_hits", force: :cascade do |t|
    t.string   "url"
    t.integer  "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rates", force: :cascade do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "stars",         null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type"
  add_index "rates", ["rater_id"], name: "index_rates_on_rater_id"

  create_table "rating_caches", force: :cascade do |t|
    t.integer  "cacheable_id"
    t.string   "cacheable_type"
    t.float    "avg",            null: false
    t.integer  "qty",            null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rating_caches", ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type"

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "profile_picture"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.boolean  "is_vendor"
  end

  create_table "vendor_categories", force: :cascade do |t|
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.binary   "pic"
  end

  create_table "vendor_photos", force: :cascade do |t|
    t.binary   "photo"
    t.text     "description"
    t.string   "tag"
    t.string   "string"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "vendor_id"
  end

  add_index "vendor_photos", ["vendor_id"], name: "index_vendor_photos_on_vendor_id"

  create_table "vendor_reviews_and_ratings", force: :cascade do |t|
    t.integer  "vendor_id"
    t.integer  "user_id"
    t.text     "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "rating"
  end

  add_index "vendor_reviews_and_ratings", ["user_id"], name: "index_vendor_reviews_and_ratings_on_user_id"
  add_index "vendor_reviews_and_ratings", ["vendor_id"], name: "index_vendor_reviews_and_ratings_on_vendor_id"

  create_table "vendor_sub_categories", force: :cascade do |t|
    t.string   "sub_category"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.binary   "pic"
  end

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
    t.integer  "events_handled"
    t.integer  "category_id"
    t.binary   "cover_pic"
    t.integer  "user_id"
    t.boolean  "is_verified"
    t.string   "verifier_name"
  end

  add_index "vendors", ["category_id"], name: "index_vendors_on_category_id"
  add_index "vendors", ["user_id"], name: "index_vendors_on_user_id"
  add_index "vendors", ["vendor_sub_category_id"], name: "index_vendors_on_vendor_sub_category_id"

end
