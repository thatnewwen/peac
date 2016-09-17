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

ActiveRecord::Schema.define(version: 20160829020907) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "university"
    t.integer  "graduation_year"
    t.string   "company"
    t.string   "current_location"
    t.string   "gender"
    t.string   "start_date_current"
    t.string   "start_date_pe"
    t.string   "industry_preference_first"
    t.string   "industry_preference_second"
    t.string   "industry_preference_third"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
  end

end
