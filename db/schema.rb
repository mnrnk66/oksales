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

ActiveRecord::Schema.define(version: 20140201113644) do

  create_table "clients", force: true do |t|
    t.string   "name"
    t.string   "abbr"
    t.string   "code"
    t.string   "full_name"
    t.string   "full_name_kana"
    t.string   "zipcode"
    t.string   "pref_name"
    t.string   "address_city"
    t.string   "address_extra"
    t.string   "sales_person_name"
    t.string   "sales_person_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "code",                                        null: false
    t.string   "name",                                        null: false
    t.string   "short_name"
    t.string   "kana"
    t.integer  "product_group_id"
    t.decimal  "price",              precision: 15, scale: 2
    t.decimal  "cost_price",         precision: 15, scale: 2
    t.integer  "tax_type"
    t.integer  "tax_class_id"
    t.string   "district"
    t.integer  "supplire_id"
    t.integer  "unit_id"
    t.decimal  "qty_per_box",        precision: 15, scale: 2
    t.integer  "price_type"
    t.boolean  "item_of_matrixlist"
    t.date     "valid_from"
    t.date     "valid_until"
    t.integer  "create_user_id"
    t.integer  "update_user_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "supplires", force: true do |t|
    t.string   "code",                                   null: false
    t.string   "name",                                   null: false
    t.string   "short_name"
    t.string   "kana"
    t.string   "postal_code"
    t.string   "address1"
    t.string   "address2"
    t.string   "address3"
    t.string   "tel"
    t.string   "fax"
    t.string   "url"
    t.string   "pic_name"
    t.string   "pic_email"
    t.decimal  "price_ratio",    precision: 5, scale: 2
    t.integer  "create_user_id"
    t.integer  "update_user_id"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "units", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "create_user_id"
    t.integer  "update_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
