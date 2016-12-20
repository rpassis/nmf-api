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

ActiveRecord::Schema.define(version: 20161220032021) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencies", id: :string, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.string   "url"
    t.string   "timezone"
    t.string   "lang"
    t.string   "phone"
  end

  create_table "routes", id: :string, force: :cascade do |t|
    t.string   "agency_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "short_name"
    t.string   "long_name"
    t.string   "of_type"
    t.string   "desc"
    t.string   "url"
    t.string   "color"
    t.string   "text_color"
  end

  create_table "stop_times", id: :string, force: :cascade do |t|
    t.string   "trip_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "arrival_time"
    t.string   "departure_time"
    t.string   "stop_id"
    t.string   "sequence"
    t.string   "headsign"
    t.string   "pickup_type"
    t.string   "drop_off_type"
    t.string   "shape_dist_travelled"
  end

  create_table "stops", id: :string, force: :cascade do |t|
    t.string   "stop_time_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "trips", id: :string, force: :cascade do |t|
    t.string   "route_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "service_id"
    t.string   "headsign"
    t.string   "short_name"
    t.string   "direction_id"
    t.string   "block_id"
    t.string   "shape_id"
    t.string   "wheelchair_accessible"
    t.string   "bikes_allowed"
  end

end
