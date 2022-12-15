# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_09_15_102641) do
  create_table "bookings", force: :cascade do |t|
    t.integer "listing_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_bookings_on_listing_id"
  end

  create_table "listings", force: :cascade do |t|
    t.string "name"
    t.integer "num_rooms"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "missions", force: :cascade do |t|
    t.integer "listing_id", null: false
    t.integer "price"
    t.string "mission_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.index ["listing_id"], name: "index_missions_on_listing_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "listing_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_reservations_on_listing_id"
  end

  add_foreign_key "bookings", "listings"
  add_foreign_key "missions", "listings"
  add_foreign_key "reservations", "listings"
end
