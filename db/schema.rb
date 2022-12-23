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

ActiveRecord::Schema.define(version: 2018_01_09_111454) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "activities", force: :cascade do |t|
    t.date "date"
    t.bigint "workout_id"
    t.bigint "sport_id"
    t.float "km"
    t.float "minutes"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "race_id"
    t.datetime "imported_at"
    t.index ["race_id"], name: "index_activities_on_race_id"
    t.index ["sport_id"], name: "index_activities_on_sport_id"
    t.index ["workout_id"], name: "index_activities_on_workout_id"
  end

  create_table "measurements", force: :cascade do |t|
    t.float "weight"
    t.float "waist"
    t.float "hips"
    t.float "thigh"
    t.datetime "measured_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "races", force: :cascade do |t|
    t.bigint "sport_id"
    t.float "goal_time"
    t.float "actual_time"
    t.float "distance"
    t.date "date"
    t.string "name"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sport_id"], name: "index_races_on_sport_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "strava_data", force: :cascade do |t|
    t.bigint "activity_id"
    t.integer "strava_id"
    t.jsonb "data", default: {}
    t.jsonb "laps", default: {}
    t.jsonb "zones", default: {}
    t.jsonb "streams", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_strava_data_on_activity_id"
  end

  create_table "workout_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workouts", force: :cascade do |t|
    t.date "date"
    t.bigint "sport_id"
    t.float "km"
    t.float "minutes"
    t.bigint "workout_type_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sport_id"], name: "index_workouts_on_sport_id"
    t.index ["workout_type_id"], name: "index_workouts_on_workout_type_id"
  end

  add_foreign_key "activities", "sports"
  add_foreign_key "activities", "workouts"
  add_foreign_key "races", "sports"
  add_foreign_key "strava_data", "activities"
end
