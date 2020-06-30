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

ActiveRecord::Schema.define(version: 2020_06_30_104423) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "affiliations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "federation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["federation_id"], name: "index_affiliations_on_federation_id"
    t.index ["user_id"], name: "index_affiliations_on_user_id"
  end

  create_table "competition_divisions", force: :cascade do |t|
    t.bigint "competition_id", null: false
    t.bigint "division_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["competition_id"], name: "index_competition_divisions_on_competition_id"
    t.index ["division_id"], name: "index_competition_divisions_on_division_id"
  end

  create_table "competitions", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.bigint "federation_id", null: false
    t.date "date"
    t.text "description"
    t.integer "prize"
    t.date "registration_deadline"
    t.integer "registration_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["federation_id"], name: "index_competitions_on_federation_id"
  end

  create_table "criteria", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "division_criteria", force: :cascade do |t|
    t.bigint "division_id", null: false
    t.bigint "criterium_id", null: false
    t.integer "min"
    t.integer "max"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["criterium_id"], name: "index_division_criteria_on_criterium_id"
    t.index ["division_id"], name: "index_division_criteria_on_division_id"
  end

  create_table "divisions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "federations", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_federations_on_email", unique: true
    t.index ["reset_password_token"], name: "index_federations_on_reset_password_token", unique: true
  end

  create_table "positions", force: :cascade do |t|
    t.integer "position"
    t.integer "position_points"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "registrations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "competition_division_id", null: false
    t.bigint "position_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["competition_division_id"], name: "index_registrations_on_competition_division_id"
    t.index ["position_id"], name: "index_registrations_on_position_id"
    t.index ["user_id"], name: "index_registrations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.string "nationality"
    t.string "gender"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "affiliations", "federations"
  add_foreign_key "affiliations", "users"
  add_foreign_key "competition_divisions", "competitions"
  add_foreign_key "competition_divisions", "divisions"
  add_foreign_key "competitions", "federations"
  add_foreign_key "division_criteria", "criteria"
  add_foreign_key "division_criteria", "divisions"
  add_foreign_key "registrations", "competition_divisions"
  add_foreign_key "registrations", "positions"
  add_foreign_key "registrations", "users"
end
