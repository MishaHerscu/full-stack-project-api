# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160628035834) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assists", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "assists", ["game_id"], name: "index_assists_on_game_id", using: :btree
  add_index "assists", ["player_id"], name: "index_assists_on_player_id", using: :btree

  create_table "examples", force: :cascade do |t|
    t.text     "text",       null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "examples", ["user_id"], name: "index_examples_on_user_id", using: :btree

  create_table "games", force: :cascade do |t|
    t.date     "date"
    t.string   "opponent"
    t.string   "won"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "games", ["team_id"], name: "index_games_on_team_id", using: :btree

  create_table "goals", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "goals", ["game_id"], name: "index_goals_on_game_id", using: :btree
  add_index "goals", ["player_id"], name: "index_goals_on_player_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.string   "surname"
    t.string   "given_name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "captain"
    t.integer  "team_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "players", ["team_id"], name: "index_players_on_team_id", using: :btree
  add_index "players", ["user_id"], name: "index_players_on_user_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "token",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["token"], name: "index_users_on_token", unique: true, using: :btree

  add_foreign_key "assists", "games"
  add_foreign_key "assists", "players"
  add_foreign_key "examples", "users"
  add_foreign_key "games", "teams"
  add_foreign_key "goals", "games"
  add_foreign_key "goals", "players"
  add_foreign_key "players", "teams"
  add_foreign_key "players", "users"
end
