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

ActiveRecord::Schema.define(version: 20150701102227) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text     "answer"
    t.string   "description"
    t.string   "status",      default: "ACTIVE"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "problem_id"
    t.integer  "user_id"
    t.string   "slug"
  end

  add_index "answers", ["problem_id"], name: "index_answers_on_problem_id", using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "apis", force: :cascade do |t|
    t.string  "title"
    t.integer "user_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.integer  "doctor_id"
    t.integer  "patient_id"
    t.datetime "appointment_created_at"
    t.datetime "appointment_at"
  end

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "comment"
    t.string   "status",     default: "ACTIVE"
    t.integer  "comment_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["comment_id"], name: "index_comments_on_comment_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "contact"
    t.text     "message"
    t.string   "status",     default: "ACTIVE"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", force: :cascade do |t|
    t.string   "title"
    t.string   "iso"
    t.string   "code"
    t.string   "currency"
    t.string   "capital"
    t.string   "language"
    t.string   "sex_ratio"
    t.string   "litracy"
    t.string   "population"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "developments", force: :cascade do |t|
    t.string  "title"
    t.string  "dev_type", default: "WEB"
    t.integer "user_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.text     "address"
    t.string   "practice"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "downloads", force: :cascade do |t|
    t.string   "download"
    t.string   "filename"
    t.string   "extension"
    t.boolean  "ready_to_download", default: false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "educations", force: :cascade do |t|
    t.string   "title"
    t.string   "school"
    t.text     "description"
    t.string   "status",       default: "COMPLETED"
    t.datetime "started_at"
    t.datetime "completed_at"
    t.integer  "user_id"
  end

  create_table "employments", force: :cascade do |t|
    t.string   "role"
    t.string   "company"
    t.text     "description"
    t.string   "status",      default: "PREVIOUS"
    t.datetime "joined_at"
    t.datetime "leaved_at"
    t.integer  "user_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "image"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images", ["imageable_id"], name: "index_images_on_imageable_id", using: :btree

  create_table "infos", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "date_of_birth"
    t.string   "contact"
    t.string   "gender"
    t.text     "address"
    t.text     "about_yourself"
    t.string   "martial_status"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "state_id"
    t.integer  "country_id"
    t.string   "city"
  end

  add_index "infos", ["user_id"], name: "index_infos_on_user_id", using: :btree

  create_table "lessions", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "movies", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "contact"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.text     "address"
    t.string   "problem"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", force: :cascade do |t|
    t.string  "image"
    t.integer "picturable_id"
    t.string  "picturable_type"
  end

  add_index "pictures", ["picturable_type", "picturable_id"], name: "index_pictures_on_picturable_type_and_picturable_id", using: :btree

  create_table "portfolios", force: :cascade do |t|
    t.string   "title"
    t.string   "image"
    t.string   "url"
    t.string   "tools"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "image"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "problems", force: :cascade do |t|
    t.text     "problem"
    t.string   "description"
    t.string   "status",      default: "ACTIVE"
    t.integer  "solution_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "problems", ["solution_id"], name: "index_problems_on_solution_id", using: :btree
  add_index "problems", ["user_id"], name: "index_problems_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "solutions", force: :cascade do |t|
    t.string   "solution"
    t.string   "description"
    t.string   "image"
    t.string   "status",      default: "ACTIVE"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "states", force: :cascade do |t|
    t.string   "title"
    t.string   "capital"
    t.string   "language"
    t.string   "sex_ratio"
    t.string   "litracy"
    t.string   "population"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "states", ["country_id"], name: "index_states_on_country_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.string   "contact"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "name"
    t.string   "contact"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "technologies", force: :cascade do |t|
    t.string  "title"
    t.string  "tech_type", default: "WEB"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",                         null: false
    t.string   "encrypted_password",     default: "",                         null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                          null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,                          null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.integer  "role_id",                default: 2
    t.string   "image"
    t.string   "provider"
    t.string   "uid"
    t.string   "resume_doc"
    t.string   "resume_pdf"
    t.string   "slug"
    t.string   "web_site",               default: "http://www.snmmaurya.com"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "identities", "users"
end
