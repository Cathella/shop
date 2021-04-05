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

ActiveRecord::Schema.define(version: 2021_03_17_034150) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "denshobato_blacklists", force: :cascade do |t|
    t.string "blocker_type"
    t.bigint "blocker_id"
    t.string "blocked_type"
    t.bigint "blocked_id"
    t.index ["blocked_type", "blocked_id"], name: "blocked_user"
    t.index ["blocker_type", "blocker_id"], name: "blocker_user"
  end

  create_table "denshobato_conversations", force: :cascade do |t|
    t.boolean "trashed", default: false
    t.string "sender_type"
    t.bigint "sender_id"
    t.string "recipient_type"
    t.bigint "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_type", "recipient_id"], name: "conversation_polymorphic_recipient"
    t.index ["sender_type", "sender_id"], name: "conversation_polymorphic_sender"
  end

  create_table "denshobato_messages", force: :cascade do |t|
    t.text "body", default: ""
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "message_polymorphic_author"
  end

  create_table "denshobato_notifications", force: :cascade do |t|
    t.integer "message_id"
    t.integer "conversation_id"
    t.index ["conversation_id"], name: "notification_for_conversation"
    t.index ["message_id", "conversation_id"], name: "unique_messages_for_conversations", unique: true
    t.index ["message_id"], name: "notification_for_message"
  end

  create_table "resellers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_resellers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_resellers_on_reset_password_token", unique: true
  end

end
