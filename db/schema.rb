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

ActiveRecord::Schema.define(version: 2020_05_28_205326) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "comments", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "meme_id", null: false
    t.text "body", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "meme_id"], name: "index_comments_on_user_id_and_meme_id"
  end

  create_table "memes", force: :cascade do |t|
    t.string "title", null: false
    t.string "type"
    t.string "url_source", null: false
    t.integer "votes_count", default: 0
    t.integer "comments_count", default: 0
    t.bigint "category_id", null: false
    t.bigint "owner_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_memes_on_category_id"
    t.index ["owner_id"], name: "index_memes_on_owner_id"
    t.index ["title"], name: "index_memes_on_title", unique: true
  end

  create_table "memes_tags", id: false, force: :cascade do |t|
    t.bigint "meme_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["meme_id", "tag_id"], name: "index_memes_tags_on_meme_id_and_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "user_votes_memes", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "meme_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "meme_id"], name: "index_user_votes_memes_on_user_id_and_meme_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", default: "", null: false
    t.integer "memes_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "comments", "memes"
  add_foreign_key "comments", "users"
  add_foreign_key "memes", "categories"
  add_foreign_key "memes", "users", column: "owner_id"
  add_foreign_key "memes_tags", "memes"
  add_foreign_key "memes_tags", "tags"
  add_foreign_key "user_votes_memes", "memes"
  add_foreign_key "user_votes_memes", "users"
end
