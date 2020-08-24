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

ActiveRecord::Schema.define(version: 2020_08_24_150934) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.string "name"
    t.bigint "ticket_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ticket_id"], name: "index_conversations_on_ticket_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "conversation_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "value"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "ticket_categories", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "ticket_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_ticket_categories_on_category_id"
    t.index ["ticket_id"], name: "index_ticket_categories_on_ticket_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "description"
    t.boolean "solved"
    t.bigint "mom_id", null: false
    t.bigint "helper_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["helper_id"], name: "index_tickets_on_helper_id"
    t.index ["mom_id"], name: "index_tickets_on_mom_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.boolean "mom"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "conversations", "tickets"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users"
  add_foreign_key "ratings", "users"
  add_foreign_key "ticket_categories", "categories"
  add_foreign_key "ticket_categories", "tickets"
  add_foreign_key "tickets", "users", column: "helper_id"
  add_foreign_key "tickets", "users", column: "mom_id"
end
