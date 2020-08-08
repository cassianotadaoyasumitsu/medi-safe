# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_08_020801) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "doctors", force: :cascade do |t|
    t.string "name"
    t.string "contact"
    t.string "specialty"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "nurse_tasks", force: :cascade do |t|
    t.text "note"
    t.boolean "completed", default: false
    t.bigint "task_template_id", null: false
    t.bigint "user_id", null: false
    t.bigint "helper_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "position"
    t.integer "slot"
    t.index ["helper_id"], name: "index_nurse_tasks_on_helper_id"
    t.index ["task_template_id"], name: "index_nurse_tasks_on_task_template_id"
    t.index ["user_id"], name: "index_nurse_tasks_on_user_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.string "age"
    t.string "severity"
    t.string "room"
    t.string "bed"
    t.bigint "doctor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "emr_id"
    t.index ["doctor_id"], name: "index_patients_on_doctor_id"
  end

  create_table "task_templates", force: :cascade do |t|
    t.integer "frequency"
    t.boolean "active", default: true
    t.bigint "patient_id", null: false
    t.bigint "task_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id"], name: "index_task_templates_on_patient_id"
    t.index ["task_id"], name: "index_task_templates_on_task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "description"
    t.integer "duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.bigint "leader_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["leader_id"], name: "index_users_on_leader_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "nurse_tasks", "task_templates"
  add_foreign_key "nurse_tasks", "users"
  add_foreign_key "nurse_tasks", "users", column: "helper_id"
  add_foreign_key "patients", "doctors"
  add_foreign_key "task_templates", "patients"
  add_foreign_key "task_templates", "tasks"
  add_foreign_key "users", "users", column: "leader_id"
end
