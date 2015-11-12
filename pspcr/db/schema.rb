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

ActiveRecord::Schema.define(version: 20151112102221) do

  create_table "deputies", force: :cascade do |t|
    t.integer  "artificial_id"
    t.integer  "person_id"
    t.string   "web"
    t.string   "street"
    t.string   "city"
    t.string   "postal_code"
    t.string   "email"
    t.string   "telefon"
    t.string   "fax"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "deputies", ["person_id"], name: "index_deputies_on_person_id"

  create_table "people", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "degree_pre"
    t.string   "degree_post"
    t.date     "born_at"
    t.date     "died_at"
    t.string   "gender"
    t.integer  "old_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
