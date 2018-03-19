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

ActiveRecord::Schema.define(version: 20161206042236) do

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.string   "uin"
    t.string   "tel"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  create_table "dynasties", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.integer  "year"
    t.string   "semester"
    t.string   "category"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "datetime"
  end

  create_table "events_users", id: false, force: :cascade do |t|
    t.integer "event_id"
    t.integer "user_id"
  end

  add_index "events_users", ["event_id", "user_id"], name: "index_events_users_on_event_id_and_user_id"
  add_index "events_users", ["user_id"], name: "index_events_users_on_user_id"

  create_table "point_rules", force: :cascade do |t|
    t.string   "name"
    t.integer  "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "uin"
    t.string   "tel"
    t.string   "email"
    t.string   "membership"
    t.string   "shirt"
    t.string   "classification"
    t.string   "dynasty"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.integer  "points"
  end

  add_index "users", ["uin"], name: "index_users_on_uin", unique: true

end
