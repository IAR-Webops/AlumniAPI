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

ActiveRecord::Schema.define(version: 20150623141902) do

  create_table "apps", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "devs", force: :cascade do |t|
    t.string   "name",           limit: 255,             null: false
    t.integer  "access_level",   limit: 4,   default: 4, null: false
    t.string   "remember_token", limit: 255
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "devs", ["access_level"], name: "index_devs_on_access_level", using: :btree

  create_table "identities", force: :cascade do |t|
    t.integer  "dev_id",     limit: 4
    t.string   "uid",        limit: 255
    t.string   "provider",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "identities", ["dev_id"], name: "index_identities_on_dev_id", using: :btree
  add_index "identities", ["provider"], name: "index_identities_on_provider", using: :btree

end
