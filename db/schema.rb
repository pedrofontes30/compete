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

ActiveRecord::Schema.define(version: 2020_07_08_112000) do

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
    t.datetime "start_time"
    t.float "latitude"
    t.float "longitude"
    t.datetime "start_time"
    t.string "city"
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
    t.string "name"
    t.string "location"
    t.integer "affiliation_price"
    t.index ["email"], name: "index_federations_on_email", unique: true
    t.index ["reset_password_token"], name: "index_federations_on_reset_password_token", unique: true
  end

  create_table "heat_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "heat_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["heat_id"], name: "index_heat_users_on_heat_id"
    t.index ["user_id"], name: "index_heat_users_on_user_id"
  end

  create_table "heats", force: :cascade do |t|
    t.bigint "competition_division_id", null: false
    t.integer "user_id"
    t.string "round"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["competition_division_id"], name: "index_heats_on_competition_division_id"
    t.index ["user_id"], name: "index_heats_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "state"
    t.string "registration__sku"
    t.integer "amount_cents", default: 0, null: false
    t.string "checkout_session_id"
    t.bigint "user_id", null: false
    t.bigint "registration_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "affiliation_id"
    t.index ["affiliation_id"], name: "index_orders_on_affiliation_id"
    t.index ["registration_id"], name: "index_orders_on_registration_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
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
    t.integer "position_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "sku"
    t.integer "price_cents", default: 0, null: false
    t.index ["competition_division_id"], name: "index_registrations_on_competition_division_id"
    t.index ["position_id"], name: "index_registrations_on_position_id"
    t.index ["user_id"], name: "index_registrations_on_user_id"
  end

  create_table "user_federation_division_scores", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "federation_id", null: false
    t.bigint "division_id", null: false
    t.integer "score", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["division_id"], name: "index_user_federation_division_scores_on_division_id"
    t.index ["federation_id"], name: "index_user_federation_division_scores_on_federation_id"
    t.index ["user_id"], name: "index_user_federation_division_scores_on_user_id"
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
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "affiliations", "federations"
  add_foreign_key "affiliations", "users"
  add_foreign_key "competition_divisions", "competitions"
  add_foreign_key "competition_divisions", "divisions"
  add_foreign_key "competitions", "federations"
  add_foreign_key "division_criteria", "criteria"
  add_foreign_key "division_criteria", "divisions"
  add_foreign_key "heat_users", "heats"
  add_foreign_key "heat_users", "users"
  add_foreign_key "heats", "competition_divisions"
  add_foreign_key "heats", "users"
  add_foreign_key "orders", "affiliations"
  add_foreign_key "orders", "registrations"
  add_foreign_key "orders", "users"
  add_foreign_key "registrations", "competition_divisions"
  add_foreign_key "registrations", "positions"
  add_foreign_key "registrations", "users"
  add_foreign_key "user_federation_division_scores", "divisions"
  add_foreign_key "user_federation_division_scores", "federations"
  add_foreign_key "user_federation_division_scores", "users"
end
