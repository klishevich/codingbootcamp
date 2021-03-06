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

ActiveRecord::Schema.define(version: 20181223072110) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "certificates", force: :cascade do |t|
    t.string "student"
    t.string "course_title"
    t.text "course_desc"
    t.text "mentors"
    t.date "issue_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
    t.string "video_link"
    t.text "comment_for_student"
  end

  create_table "email_wishes", force: :cascade do |t|
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.bigint "course_id"
    t.string "name"
    t.text "video_desc"
    t.text "task_desc"
    t.text "reading_desc"
    t.text "comment_desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "hint"
    t.string "video_link"
    t.boolean "notify_open", default: false
    t.index ["course_id"], name: "index_lessons_on_course_id"
  end

  create_table "my_courses", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "course_id"
    t.integer "status", default: 0
    t.string "ref"
    t.date "date_start"
    t.date "date_end"
    t.integer "grade"
    t.text "comment_for_student"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_my_courses_on_course_id"
    t.index ["user_id"], name: "index_my_courses_on_user_id"
  end

  create_table "my_lessons", force: :cascade do |t|
    t.bigint "my_course_id"
    t.bigint "lesson_id"
    t.integer "status"
    t.date "date_start"
    t.date "date_end"
    t.integer "grade"
    t.text "comment_for_student"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_my_lessons_on_lesson_id"
    t.index ["my_course_id"], name: "index_my_lessons_on_my_course_id"
  end

  create_table "my_steps", force: :cascade do |t|
    t.bigint "my_lesson_id"
    t.bigint "step_id"
    t.boolean "is_new", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["my_lesson_id"], name: "index_my_steps_on_my_lesson_id"
    t.index ["step_id"], name: "index_my_steps_on_step_id"
  end

  create_table "st_lesson_feedbacks", force: :cascade do |t|
    t.bigint "my_lesson_id"
    t.integer "grade"
    t.string "grade_comment"
    t.boolean "hw_done", default: false
    t.string "hw_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["my_lesson_id"], name: "index_st_lesson_feedbacks_on_my_lesson_id"
  end

  create_table "steps", force: :cascade do |t|
    t.bigint "lesson_id"
    t.string "name"
    t.string "video_link"
    t.text "desc"
    t.integer "step_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_steps_on_lesson_id"
  end

  create_table "test_models", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "full_name"
    t.string "preferred_name"
    t.string "phone"
    t.string "city"
    t.text "comment"
    t.boolean "is_student", default: true
    t.boolean "is_mentor", default: false
    t.boolean "is_admin", default: false
    t.boolean "is_mentor_view", default: false
    t.string "code"
    t.string "source"
    t.string "reg_code"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "lessons", "courses"
  add_foreign_key "my_courses", "courses"
  add_foreign_key "my_courses", "users"
  add_foreign_key "my_lessons", "lessons"
  add_foreign_key "my_lessons", "my_courses"
  add_foreign_key "my_steps", "my_lessons"
  add_foreign_key "my_steps", "steps"
  add_foreign_key "st_lesson_feedbacks", "my_lessons"
  add_foreign_key "steps", "lessons"
end
