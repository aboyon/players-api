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

ActiveRecord::Schema.define(version: 20150714183825) do

  create_table "matches", force: true do |t|
    t.date     "date"
    t.integer  "local_team_id"
    t.integer  "visitor_team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "player_matches", force: true do |t|
    t.integer  "player_id"
    t.integer  "match_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: true do |t|
    t.string   "name",        null: false
    t.date     "dob",         null: false
    t.string   "nationality", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seed_migration_data_migrations", force: true do |t|
    t.string   "version"
    t.integer  "runtime"
    t.datetime "migrated_on"
  end

  create_table "team_tournaments", force: true do |t|
    t.integer  "team_id"
    t.integer  "tournament_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "team_tournaments", ["team_id", "tournament_id"], name: "index_team_tournaments_on_team_id_and_tournament_id", unique: true

  create_table "teams", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tournaments", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "year"
  end

end
