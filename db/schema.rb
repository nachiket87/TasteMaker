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

ActiveRecord::Schema.define(version: 2020_08_27_173150) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_questions", force: :cascade do |t|
    t.integer "order_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "game_id"
    t.bigint "winner_id"
    t.bigint "question_id"
    t.index ["game_id"], name: "index_game_questions_on_game_id"
    t.index ["question_id"], name: "index_game_questions_on_question_id"
    t.index ["user_id"], name: "index_game_questions_on_user_id"
    t.index ["winner_id"], name: "index_game_questions_on_winner_id"
  end

  create_table "games", force: :cascade do |t|
    t.integer "host_score"
    t.integer "player_score"
    t.integer "turn_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "host_id"
    t.bigint "player_id"
    t.string "status"
    t.index ["host_id"], name: "index_games_on_host_id"
    t.index ["player_id"], name: "index_games_on_player_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id", null: false
    t.bigint "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "accepted"
    t.index ["game_id"], name: "index_notifications_on_game_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.json "answers"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "score", default: 0
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "game_questions", "games"
  add_foreign_key "game_questions", "questions"
  add_foreign_key "game_questions", "users"
  add_foreign_key "game_questions", "users", column: "winner_id"
  add_foreign_key "games", "users", column: "host_id"
  add_foreign_key "games", "users", column: "player_id"
  add_foreign_key "notifications", "games"
  add_foreign_key "notifications", "users"
end
