# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_04_170642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.date "date_arrived"
    t.float "latitude"
    t.float "longitude"
    t.string "img_url"
    t.integer "days"
    t.integer "expected_cost"
    t.bigint "trip_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trip_id"], name: "index_locations_on_trip_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "stars"
    t.string "subject"
    t.text "body"
    t.string "author"
    t.bigint "trip_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trip_id"], name: "index_reviews_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "name"
    t.string "final_destination"
    t.string "img_url"
    t.date "start_date"
    t.date "end_date"
    t.integer "expected_cost"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "locations", "trips"
  add_foreign_key "reviews", "trips"
end
