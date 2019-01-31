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

ActiveRecord::Schema.define(version: 20190130203617) do

  create_table "blocks", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.text     "body"
    t.string   "kind"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "blocks", ["user_id"], name: "index_blocks_on_user_id"

  create_table "clans", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "block_id"
  end

  add_index "comments", ["block_id"], name: "index_comments_on_block_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "displays", force: :cascade do |t|
    t.integer  "page_id"
    t.integer  "block_id"
    t.integer  "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "displays", ["block_id"], name: "index_displays_on_block_id"
  add_index "displays", ["page_id"], name: "index_displays_on_page_id"

  create_table "pages", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "description"
  end

  add_index "pages", ["user_id"], name: "index_pages_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "clan_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["clan_id"], name: "index_users_on_clan_id"

end
