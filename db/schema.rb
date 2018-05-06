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

ActiveRecord::Schema.define(version: 20180506030217) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "flights", id: :uuid, default: nil, force: :cascade do |t|
    t.date "day", null: false
    t.decimal "departure_time", null: false
    t.decimal "arrival_time", null: false
    t.string "origin", limit: 50, null: false
    t.string "destination", limit: 50, null: false
  end

  create_table "reservation_informations", id: :uuid, default: nil, force: :cascade do |t|
    t.uuid "flight_id"
    t.integer "available_tickets", null: false
    t.bit "flight_type", limit: 1, null: false
    t.integer "capacity", null: false
    t.uuid "user_id"
    t.integer "price", default: 1000, null: false
    t.string "seat"
  end

  create_table "users", id: :uuid, default: nil, force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "last_name_p", limit: 50, null: false
    t.string "last_name_m", limit: 50
    t.string "mail", limit: 50, null: false
    t.string "telephone", limit: 50, null: false
    t.date "birth_date", null: false
    t.string "passport", limit: 50, null: false
    t.integer "bags"
  end

  add_foreign_key "reservation_informations", "flights", name: "reservation_informations_flight_id_fkey"
end
