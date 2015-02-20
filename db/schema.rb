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

ActiveRecord::Schema.define(version: 20150219221238) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: true do |t|
    t.integer  "author_id",   null: false
    t.string   "title",       null: false
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "source_type"
    t.integer  "source_id"
  end

  create_table "campuses", force: true do |t|
    t.string   "name",        null: false
    t.integer  "manager_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "street",      null: false
    t.string   "city",        null: false
    t.string   "country"
    t.string   "postal_code", null: false
    t.integer  "survey_id"
  end

  create_table "enrollments", force: true do |t|
    t.integer  "student_id",  null: false
    t.integer  "section_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",      null: false
    t.integer  "grade"
    t.integer  "approver_id"
  end

  add_index "enrollments", ["section_id"], name: "index_enrollments_on_section_id", using: :btree
  add_index "enrollments", ["status"], name: "index_enrollments_on_status", using: :btree
  add_index "enrollments", ["student_id", "section_id"], name: "index_enrollments_on_student_id_and_section_id", unique: true, using: :btree
  add_index "enrollments", ["student_id"], name: "index_enrollments_on_student_id", using: :btree

  create_table "program_files", force: true do |t|
    t.string   "program_id",        null: false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "programs", force: true do |t|
    t.string   "name",       null: false
    t.string   "code"
    t.integer  "hours"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "survey_id"
  end

  create_table "sections", force: true do |t|
    t.integer  "program_id",    null: false
    t.integer  "campus_id",     null: false
    t.integer  "instructor_id", null: false
    t.string   "code",          null: false
    t.boolean  "monday"
    t.boolean  "tuesday"
    t.boolean  "wednesday"
    t.boolean  "thursday"
    t.boolean  "friday"
    t.boolean  "saturday"
    t.boolean  "sunday"
    t.integer  "start_hour"
    t.integer  "start_minute"
    t.integer  "end_hour"
    t.integer  "end_minute"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sections", ["campus_id"], name: "index_sections_on_campus_id", using: :btree
  add_index "sections", ["code", "program_id"], name: "index_sections_on_code_and_program_id", unique: true, using: :btree
  add_index "sections", ["instructor_id"], name: "index_sections_on_instructor_id", using: :btree
  add_index "sections", ["program_id"], name: "index_sections_on_program_id", using: :btree

  create_table "survey_answers", force: true do |t|
    t.string   "comment"
    t.integer  "rating"
    t.integer  "question_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subject_type", null: false
    t.integer  "subject_id",   null: false
  end

  create_table "survey_questions", force: true do |t|
    t.string   "question",    null: false
    t.string   "answer_type", null: false
    t.integer  "survey_id"
    t.integer  "min_rating"
    t.integer  "max_rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "surveys", force: true do |t|
    t.string   "title",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
  end

  create_table "users", force: true do |t|
    t.string   "email",              null: false
    t.string   "password_digest"
    t.string   "session_token",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "permission",         null: false
    t.string   "first_name",         null: false
    t.string   "last_name",          null: false
    t.string   "street"
    t.string   "city"
    t.string   "country"
    t.string   "postal_code"
    t.integer  "phone"
    t.string   "referral"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "survey_id"
    t.string   "activation_code"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["permission"], name: "index_users_on_permission", using: :btree

end
