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

ActiveRecord::Schema.define(version: 20171025202951) do

  create_table "periods", force: :cascade do |t|
    t.date "start_date_unavailable"
    t.date "end_date_unavailable"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string "area"
    t.string "title"
    t.text "description"
    t.decimal "daily_rate"
    t.integer "rooms"
    t.integer "minimum_rent_days"
    t.integer "maximum_rent_days"
    t.string "photo"
    t.integer "maximum_occupancy"
    t.text "usage_rules"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "property_location"
    t.string "property_type"
    t.integer "unavailable_period_id"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.index ["unavailable_period_id"], name: "index_properties_on_unavailable_period_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.string "user_name"
    t.string "email"
    t.date "start_date"
    t.date "end_date"
    t.decimal "total_amount"
    t.integer "total_guests"
    t.text "rent_purpose"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "property_id"
    t.boolean "agree_with_rules"
    t.integer "status", default: 0
    t.index ["property_id"], name: "index_proposals_on_property_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.decimal "daily_rate"
    t.integer "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_seasons_on_property_id"
  end

  create_table "unavailable_periods", force: :cascade do |t|
    t.date "start_date_unavailable"
    t.date "end_date_unavailable"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "property_id"
    t.index ["property_id"], name: "index_unavailable_periods_on_property_id"
  end

end
