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

ActiveRecord::Schema.define(version: 20140102225230) do

  create_table "boxes", force: true do |t|
    t.integer  "player_id"
    t.integer  "game_id"
    t.integer  "stat_id"
    t.float    "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gameresults", force: true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", force: true do |t|
    t.string   "opponent"
    t.integer  "season_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "game_date"
    t.time     "game_time"
    t.integer  "gameresult_id"
    t.integer  "gamesite_id"
    t.integer  "team_runs"
    t.integer  "opponent_team_runs"
  end

  add_index "games", ["season_id"], name: "index_games_on_season_id"

  create_table "gamesites", force: true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: true do |t|
    t.string   "name"
    t.string   "moniker"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position_id"
  end

  create_table "positions", force: true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seasons", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stats", force: true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "unique_identifier"
    t.string   "formula"
    t.string   "stat_type"
  end

end
