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

ActiveRecord::Schema.define(version: 20160627201353) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bills", force: :cascade do |t|
    t.string   "congress"
    t.string   "bill"
    t.string   "title"
    t.string   "sponsor"
    t.string   "sponsor_id"
    t.string   "introduced_date"
    t.string   "cosponsors"
    t.string   "committees"
    t.string   "latest_major_action_date"
    t.string   "latest_major_action"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "issues", force: :cascade do |t|
    t.string   "name",                    null: false
    t.string   "keywords",   default: [],              array: true
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "image"

  end

  create_table "bills_subjects", force: :cascade do |t|
    t.integer  "bill_id"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "issues", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "legislators", force: :cascade do |t|
    t.string   "bioguide_id"
    t.string   "chamber"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "party"
    t.string   "twitter_account"
    t.string   "seniority"
    t.string   "next_election"
    t.string   "total_votes"
    t.string   "missed_votes"
    t.string   "total_present"
    t.string   "state"
    t.string   "missed_votes_pct"
    t.string   "votes_with_party_pct"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "politician_issues", force: :cascade do |t|
    t.integer  "politician_id"
    t.integer  "issue_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "politicians", force: :cascade do |t|
    t.string   "name",                         null: false
    t.string   "political_party",              null: false
    t.string   "title",                        null: false
    t.string   "twitter_handle",               null: false
    t.string   "twitter_profile",              null: false
    t.string   "tweets",          default: [],              array: true
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "image"
  end

  create_table "positions", force: :cascade do |t|
    t.integer  "vote_id"
    t.string   "bioguide_id"
    t.string   "vote_position"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votes", force: :cascade do |t|
    t.string   "chamber"
    t.string   "congress"
    t.string   "session"
    t.string   "roll_call"
    t.string   "official_bill_id"
    t.string   "democratic_yes"
    t.string   "democratic_no"
    t.string   "democratic_present"
    t.string   "democratic_not_voting"
    t.string   "republican_yes"
    t.string   "republican_no"
    t.string   "republican_present"
    t.string   "republican_not_voting"
    t.string   "independent_yes"
    t.string   "independent_no"
    t.string   "independent_present"
    t.string   "independent_not_voting"
    t.string   "total_yes"
    t.string   "total_no"
    t.string   "total_present"
    t.string   "total_not_voting"
    t.integer  "bill_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
