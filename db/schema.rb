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

ActiveRecord::Schema.define(version: 20180411155643) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bags", id: :uuid, default: nil, force: :cascade do |t|
    t.string "asiento", limit: 50, null: false
    t.uuid "user_id", null: false
  end

  create_table "flight_informations", id: :uuid, default: nil, force: :cascade do |t|
    t.date "day", null: false
    t.decimal "departure_time", null: false
    t.decimal "arrival_time", null: false
    t.string "origin", limit: 50, null: false
    t.string "destination", limit: 50, null: false
  end

  create_table "reservation_informations", id: :uuid, default: nil, force: :cascade do |t|
    t.uuid "flight_id", null: false
    t.integer "available_tickets", null: false
    t.bit "flight_type", limit: 1, null: false
    t.integer "capacity", null: false
    t.uuid "reservation_id", null: false
  end

  create_table "tickets", id: :uuid, default: nil, force: :cascade do |t|
    t.string "seat", limit: 50, null: false
    t.integer "cost", null: false
    t.string "zone", limit: 50, null: false
    t.uuid "user_id", null: false
    t.uuid "flight_id", null: false
  end

  create_table "user_nationalities", id: :uuid, default: nil, force: :cascade do |t|
    t.string "origin_country", limit: 50, null: false
    t.string "currency", limit: 50, null: false
  end

  create_table "users", id: :uuid, default: nil, force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "last_name_p", limit: 50, null: false
    t.string "last_name_m", limit: 50
    t.string "mail", limit: 50, null: false
    t.string "telephone", limit: 50, null: false
    t.date "birth_date", null: false
    t.string "passport", limit: 50, null: false
    t.uuid "nationality_id", null: false
  end

  add_foreign_key "bags", "users", name: "bags_user_id_fkey"
  add_foreign_key "reservation_informations", "flight_informations", column: "flight_id", name: "reservation_informations_flight_id_fkey"
  add_foreign_key "tickets", "flight_informations", column: "flight_id", name: "tickets_flight_id_fkey"
  add_foreign_key "tickets", "users", name: "tickets_user_id_fkey"
  add_foreign_key "users", "user_nationalities", column: "nationality_id", name: "users_nationality_id_fkey"
end
