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

ActiveRecord::Schema.define(version: 20170325152117) do

  create_table "systems", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "System_Name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tables", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "Longest_Name"
    t.string   "Short_Name"
    t.string   "Table_Name"
    t.integer  "Column_Name"
    t.string   "Data_Type"
    t.integer  "Display_Width"
    t.string   "Display_Height"
    t.string   "Display_Prompt"
    t.text     "Implementation_Comment", limit: 65535
    t.integer  "version_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["version_id"], name: "index_tables_on_version_id", using: :btree
  end

  create_table "versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "Version_Name"
    t.integer  "system_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.boolean  "active"
    t.index ["system_id"], name: "index_versions_on_system_id", using: :btree
  end

  add_foreign_key "tables", "versions"
  add_foreign_key "versions", "systems"
end
