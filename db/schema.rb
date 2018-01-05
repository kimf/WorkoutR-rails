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

ActiveRecord::Schema.define(version: 2018_01_05_231906) do

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

  create_table "measurements", force: :cascade do |t|
    t.float "weight"
    t.float "waist"
    t.float "hips"
    t.float "thigh"
    t.datetime "measured_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workout_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workouts", force: :cascade do |t|
    t.date "planned_date"
    t.bigint "planned_sport_id"
    t.float "planned_km"
    t.float "planned_minutes"
    t.bigint "planned_workout_type_id"
    t.text "description"
    t.date "actual_date"
    t.bigint "actual_sport_id"
    t.float "actual_km"
    t.float "actual_minutes"
    t.bigint "actual_workout_type_id"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actual_sport_id"], name: "index_workouts_on_actual_sport_id"
    t.index ["actual_workout_type_id"], name: "index_workouts_on_actual_workout_type_id"
    t.index ["planned_sport_id"], name: "index_workouts_on_planned_sport_id"
    t.index ["planned_workout_type_id"], name: "index_workouts_on_planned_workout_type_id"
  end

  add_foreign_key "workouts", "sports", column: "actual_sport_id"
  add_foreign_key "workouts", "sports", column: "actual_workout_type_id"
  add_foreign_key "workouts", "sports", column: "planned_sport_id"
  add_foreign_key "workouts", "sports", column: "planned_workout_type_id"
end
