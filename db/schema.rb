# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_25_130522) do
  create_table "api_v1_users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "applications", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "job_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_applications_on_job_id"
    t.index ["user_id"], name: "index_applications_on_user_id"
  end

  create_table "biodata", force: :cascade do |t|
    t.string "address"
    t.text "location"
    t.date "date_of_birth"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_biodata_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.string "website"
    t.string "password"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "educations", force: :cascade do |t|
    t.string "qualification"
    t.string "university"
    t.date "date_completed"
    t.string "location"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_educations_on_user_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.string "position"
    t.string "company"
    t.date "date_joined"
    t.date "date_left"
    t.string "location"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_experiences_on_user_id"
  end

  create_table "jobapplications", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "job_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_jobapplications_on_job_id"
    t.index ["user_id"], name: "index_jobapplications_on_user_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.string "position"
    t.string "description"
    t.string "required_education"
    t.string "needed_skills"
    t.date "closing_date"
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_jobs_on_company_id"
  end

  create_table "jobscreenings", force: :cascade do |t|
    t.string "result"
    t.integer "user_id", null: false
    t.integer "job_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_jobscreenings_on_job_id"
    t.index ["user_id"], name: "index_jobscreenings_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "profile_position"
    t.string "profile_text"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "save_email_invitations", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "position"
    t.integer "job_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "interview_conducted"
    t.integer "user_id", null: false
    t.index ["job_id"], name: "index_save_email_invitations_on_job_id"
    t.index ["user_id"], name: "index_save_email_invitations_on_user_id"
  end

  create_table "save_expressions", force: :cascade do |t|
    t.string "expressions"
    t.integer "user_id", null: false
    t.integer "job_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_save_expressions_on_job_id"
    t.index ["user_id"], name: "index_save_expressions_on_user_id"
  end

  create_table "save_questions", force: :cascade do |t|
    t.string "question"
    t.string "answer"
    t.integer "job_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_save_questions_on_job_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "skname"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_skills_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "applications", "jobs"
  add_foreign_key "applications", "users"
  add_foreign_key "biodata", "users"
  add_foreign_key "educations", "users"
  add_foreign_key "experiences", "users"
  add_foreign_key "jobapplications", "jobs"
  add_foreign_key "jobapplications", "users"
  add_foreign_key "jobs", "companies"
  add_foreign_key "jobscreenings", "jobs"
  add_foreign_key "jobscreenings", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "save_email_invitations", "jobs"
  add_foreign_key "save_email_invitations", "users"
  add_foreign_key "save_expressions", "jobs"
  add_foreign_key "save_expressions", "users"
  add_foreign_key "save_questions", "jobs"
  add_foreign_key "skills", "users"
end
