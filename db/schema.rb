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

ActiveRecord::Schema.define(version: 2018_10_21_050347) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string "pinyin"
    t.string "simplified"
    t.string "definition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quiz_chars", force: :cascade do |t|
    t.bigint "quiz_id"
    t.bigint "character_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_quiz_chars_on_character_id"
    t.index ["quiz_id"], name: "index_quiz_chars_on_quiz_id"
  end

  create_table "quiz_results", force: :cascade do |t|
    t.bigint "quiz_char_id"
    t.boolean "pass"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "quiz_id"
    t.index ["quiz_char_id"], name: "index_quiz_results_on_quiz_char_id"
    t.index ["quiz_id"], name: "index_quiz_results_on_quiz_id"
    t.index ["user_id"], name: "index_quiz_results_on_user_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_quizzes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "quiz_chars", "characters"
  add_foreign_key "quiz_chars", "quizzes"
  add_foreign_key "quiz_results", "quiz_chars"
  add_foreign_key "quiz_results", "quizzes"
  add_foreign_key "quiz_results", "users"
  add_foreign_key "quizzes", "users"
end