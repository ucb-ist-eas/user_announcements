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

ActiveRecord::Schema.define(version: 20130609132557) do

  create_table "announcements", force: :cascade do |t|
    t.text     "message"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.boolean  "active"
    t.text     "roles"
    t.text     "types"
    t.text     "style"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hidden_announcements", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "announcement_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hidden_announcements", ["announcement_id"], name: "index_hidden_announcements_on_announcement_id"
  add_index "hidden_announcements", ["user_id"], name: "index_hidden_announcements_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
