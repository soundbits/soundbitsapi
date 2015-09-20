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

ActiveRecord::Schema.define(version: 20150920140231) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "episodes", force: :cascade do |t|
    t.string   "podcast"
    t.string   "full_name"
    t.string   "description"
    t.string   "podcast_image_url"
    t.string   "audio_url"
    t.string   "audio_length"
    t.string   "excerpt_text"
    t.string   "excerpt_url"
    t.string   "episode_duration"
    t.integer  "start_time"
    t.integer  "end_time"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "episodes_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "episode_id"
  end

  add_index "episodes_users", ["episode_id"], name: "index_episodes_users_on_episode_id", using: :btree
  add_index "episodes_users", ["user_id"], name: "index_episodes_users_on_user_id", using: :btree

  create_table "rejections_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "episode_id"
  end

  add_index "rejections_users", ["episode_id"], name: "index_rejections_users_on_episode_id", using: :btree
  add_index "rejections_users", ["user_id"], name: "index_rejections_users_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "avatar_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
