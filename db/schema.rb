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

ActiveRecord::Schema.define(version: 20160829185904) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "challenge_members", force: :cascade do |t|
    t.string   "name",              null: false
    t.string   "email",             null: false
    t.integer  "challenge_team_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "challenge_members", ["email"], name: "index_challenge_members_on_email", unique: true, using: :btree

  create_table "challenge_teams", force: :cascade do |t|
    t.string   "name",                    null: false
    t.integer  "limit",      default: 10, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "facilitator"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "kind"
  end

  create_table "packages", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "limit"
    t.string   "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "payments", force: :cascade do |t|
    t.string   "method"
    t.integer  "portions"
    t.integer  "portions_paid"
    t.float    "price"
    t.string   "link_1"
    t.string   "link_2"
    t.string   "link_3"
    t.string   "link_4"
    t.datetime "update_at"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "status"
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "buyer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "purchases", ["event_id", "buyer_id"], name: "index_purchases_on_event_id_and_buyer_id", unique: true, using: :btree

  create_table "schedules", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "event_id"
  end

  add_index "schedules", ["event_id"], name: "index_schedules_on_event_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.integer  "semester"
    t.string   "course"
    t.string   "university"
    t.date     "birthday"
    t.boolean  "qualified"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "schedules", "events"
end
