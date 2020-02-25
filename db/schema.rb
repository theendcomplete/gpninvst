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

ActiveRecord::Schema.define(version: 2020_02_11_110401) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

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

  create_table "addresses", force: :cascade do |t|
    t.string "address_string"
    t.string "city"
    t.string "country"
    t.string "postalcode"
    t.float "latitude"
    t.float "longitude"
    t.jsonb "address_data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "event_organizers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "event_id"
    t.boolean "creator", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_event_organizers_on_event_id"
    t.index ["user_id", "event_id"], name: "index_event_organizers_on_user_id_and_event_id", unique: true
    t.index ["user_id"], name: "index_event_organizers_on_user_id"
  end

  create_table "event_participants", force: :cascade do |t|
    t.bigint "investor_id", null: false
    t.bigint "event_id", null: false
    t.boolean "confirmed", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.index ["event_id"], name: "index_event_participants_on_event_id"
    t.index ["investor_id", "event_id"], name: "index_event_participants_on_investor_id_and_event_id", unique: true
    t.index ["investor_id"], name: "index_event_participants_on_investor_id"
    t.index ["uuid"], name: "index_event_participants_on_uuid", unique: true
  end

  create_table "event_tags", force: :cascade do |t|
    t.bigint "tag_id"
    t.bigint "event_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id", "tag_id"], name: "index_event_tags_on_event_id_and_tag_id", unique: true
    t.index ["event_id"], name: "index_event_tags_on_event_id"
    t.index ["tag_id"], name: "index_event_tags_on_tag_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name", null: false
    t.integer "event_type", default: 0, null: false
    t.integer "default_language", default: 0, null: false
    t.integer "status_code", default: 0, null: false
    t.text "description"
    t.datetime "start_at"
    t.datetime "finish_at"
    t.text "timezones"
    t.text "event_link"
    t.boolean "confirmable", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "address_id"
    t.index ["confirmable"], name: "index_events_on_confirmable"
    t.index ["default_language"], name: "index_events_on_default_language"
    t.index ["event_type"], name: "index_events_on_event_type"
    t.index ["status_code"], name: "index_events_on_status_code"
  end

  create_table "investors", force: :cascade do |t|
    t.string "first_name", limit: 48
    t.string "last_name", limit: 48
    t.string "email", limit: 72
    t.string "phone", limit: 48
    t.string "geo_region"
    t.string "country"
    t.string "city"
    t.string "address"
    t.string "status"
    t.date "last_active_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "institution_title"
    t.string "institution_type_title"
    t.string "side_title"
    t.string "asset_class_title"
    t.string "job_function_title"
    t.index ["email"], name: "index_investors_on_email"
    t.index ["phone"], name: "index_investors_on_phone"
  end

  create_table "notes", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.bigint "user_id", null: false
    t.bigint "investor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["investor_id"], name: "index_notes_on_investor_id"
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "server_errors", force: :cascade do |t|
    t.text "message"
    t.text "backtrace"
    t.jsonb "extra"
    t.string "request_token"
    t.string "request_remote_ip"
    t.string "request_method"
    t.string "request_original_url"
    t.string "request_params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settings", force: :cascade do |t|
    t.string "key", null: false
    t.jsonb "value"
    t.string "datatype", limit: 16, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_settings_on_key", unique: true
    t.index ["value"], name: "index_settings_on_value"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_action_tokens", force: :cascade do |t|
    t.string "token", limit: 256, null: false
    t.string "type_code", limit: 64, null: false
    t.bigint "user_id", null: false
    t.datetime "expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_action_tokens_on_user_id"
  end

  create_table "user_tokens", id: false, force: :cascade do |t|
    t.string "token", null: false
    t.bigint "user_id"
    t.string "http_remote_addr", null: false
    t.string "http_user_agent", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token", "user_id"], name: "index_user_tokens_on_token_and_user_id"
    t.index ["token"], name: "index_user_tokens_on_token", unique: true
    t.index ["user_id"], name: "index_user_tokens_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "login", limit: 48, null: false
    t.string "email", limit: 48
    t.string "phone", limit: 48
    t.string "password_digest", limit: 1024, null: false
    t.string "first_name", limit: 48
    t.string "last_name", limit: 48
    t.string "status_code", limit: 64, null: false
    t.string "role_code", limit: 64, null: false
    t.integer "auth_attempts", default: 0, null: false
    t.datetime "auth_blocked_until"
    t.datetime "password_updated_at"
    t.datetime "archived_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["login"], name: "index_users_on_login", unique: true
    t.index ["phone"], name: "index_users_on_phone"
    t.index ["role_code"], name: "index_users_on_role_code"
    t.index ["status_code"], name: "index_users_on_status_code"
  end

  add_foreign_key "notes", "investors"
  add_foreign_key "notes", "users"
  add_foreign_key "user_action_tokens", "users"
  add_foreign_key "user_tokens", "users"

  create_view "investor_attrs", sql_definition: <<-SQL
      SELECT t1.id AS investor_id,
      concat(t1.first_name, ' ', t1.last_name) AS full_name
     FROM investors t1;
  SQL
end
