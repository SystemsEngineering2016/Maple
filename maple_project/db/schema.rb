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

ActiveRecord::Schema.define(version: 20170414183957) do

  create_table "maps", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "mapfrom_id"
    t.integer "mapto_id"
    t.string  "fromVersionName"
    t.string  "toVersionName"
    t.string  "map_comment"
    t.index ["mapfrom_id"], name: "index_maps_on_mapfrom_id", using: :btree
    t.index ["mapto_id"], name: "index_maps_on_mapto_id", using: :btree
  end

  create_table "systems", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "System_Name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tables", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "Logical_Name"
    t.string   "Short_Name"
    t.string   "Table_Name"
    t.string   "Column_Name"
    t.string   "Data_Type"
    t.integer  "Display_Width"
    t.integer  "Display_Height"
    t.string   "Display_Prompt"
    t.text     "Implementation_Comment", limit: 65535
    t.string   "Data_Point_Status"
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
