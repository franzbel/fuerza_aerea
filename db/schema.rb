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

ActiveRecord::Schema.define(version: 20160114163600) do

  create_table "components", force: :cascade do |t|
    t.string   "name"
    t.string   "state",        default: "new"
    t.time     "elapsed_time", default: '2000-01-01 00:00:00'
    t.integer  "system_id"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "components", ["system_id"], name: "index_components_on_system_id"

  create_table "flight_sheets", force: :cascade do |t|
    t.time     "departure_time", default: '2000-01-01 00:00:00'
    t.time     "arrival_time",   default: '2000-01-01 00:00:00'
    t.integer  "helicopter_id"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.time     "flight_time"
  end

  add_index "flight_sheets", ["helicopter_id"], name: "index_flight_sheets_on_helicopter_id"

  create_table "helicopters", force: :cascade do |t|
    t.string   "plate_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "parts", force: :cascade do |t|
    t.string   "part_number"
    t.integer  "component_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "parts", ["component_id"], name: "index_parts_on_component_id"

  create_table "scheduled_inspections", force: :cascade do |t|
    t.integer  "helicopter_id"
    t.time     "flight_hours",            default: '2000-01-01 00:00:00'
    t.boolean  "supplementary_check_50",  default: false
    t.boolean  "supplementary_check_100", default: false
    t.boolean  "intermediate_inspection", default: false
    t.boolean  "periodical_inspection",   default: false
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
  end

  add_index "scheduled_inspections", ["helicopter_id"], name: "index_scheduled_inspections_on_helicopter_id"

  create_table "systems", force: :cascade do |t|
    t.integer  "ata_100"
    t.string   "title"
    t.integer  "helicopter_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "systems", ["helicopter_id"], name: "index_systems_on_helicopter_id"

  create_table "tbos", force: :cascade do |t|
    t.integer  "initial_value"
    t.integer  "end_value"
    t.string   "unit"
    t.integer  "component_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "tbos", ["component_id"], name: "index_tbos_on_component_id"

end
