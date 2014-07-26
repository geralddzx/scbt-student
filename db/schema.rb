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

ActiveRecord::Schema.define(version: 20140726045305) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: true do |t|
    t.string   "name",       null: false
    t.string   "code"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "hours"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_enrollments", force: true do |t|
    t.string   "student_id", null: false
    t.string   "course_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "student_enrollments", ["course_id"], name: "index_student_enrollments_on_course_id", using: :btree
  add_index "student_enrollments", ["student_id", "course_id"], name: "index_student_enrollments_on_student_id_and_course_id", unique: true, using: :btree
  add_index "student_enrollments", ["student_id"], name: "index_student_enrollments_on_student_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "permission",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
