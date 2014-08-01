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

ActiveRecord::Schema.define(version: 20140731213701) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: true do |t|
    t.string   "name",          null: false
    t.string   "code"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "hours"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "instructor_id"
  end

  add_index "courses", ["instructor_id"], name: "index_courses_on_instructor_id", using: :btree

  create_table "enrollments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",      null: false
    t.integer  "student_id",  null: false
    t.integer  "course_id",   null: false
    t.integer  "grade"
    t.integer  "approver_id"
  end

  add_index "enrollments", ["status"], name: "index_enrollments_on_status", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "permission",      null: false
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["permission"], name: "index_users_on_permission", using: :btree

end
