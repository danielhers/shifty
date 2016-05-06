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

ActiveRecord::Schema.define(version: 20150730122556) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "milestone_accomplishments", force: :cascade do |t|
    t.integer  "milestone_id"
    t.integer  "worker_id"
    t.date     "date"
    t.text     "notes"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "milestone_accomplishments", ["milestone_id"], name: "index_milestone_accomplishments_on_milestone_id", using: :btree
  add_index "milestone_accomplishments", ["worker_id"], name: "index_milestone_accomplishments_on_worker_id", using: :btree

  create_table "milestones", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "pay_rates", force: :cascade do |t|
    t.integer  "worker_id"
    t.date     "effective"
    t.integer  "hourly_pay_in_cents"
    t.integer  "hourly_capital_contribution_in_cents"
    t.integer  "hourly_predicted_extra_wage_in_cents"
    t.text     "notes"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "pay_rates", ["worker_id"], name: "index_pay_rates_on_worker_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "shift_templates", force: :cascade do |t|
    t.string   "name"
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shifts", force: :cascade do |t|
    t.integer  "worker_id"
    t.integer  "day_of_week"
    t.date     "monday"
    t.string   "start_time"
    t.string   "end_time"
    t.integer  "task_id"
    t.text     "notes"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.text     "description"
    t.integer  "shift_template_id"
  end

  add_index "shifts", ["shift_template_id"], name: "index_shifts_on_shift_template_id", using: :btree
  add_index "shifts", ["task_id"], name: "index_shifts_on_task_id", using: :btree
  add_index "shifts", ["worker_id"], name: "index_shifts_on_worker_id", using: :btree

  create_table "tasks", force: :cascade do |t|
    t.string   "name"
    t.integer  "workgroup_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "tasks", ["workgroup_id"], name: "index_tasks_on_workgroup_id", using: :btree

  create_table "transactions", force: :cascade do |t|
    t.integer  "amount_in_cents"
    t.date     "date_made"
    t.integer  "worker_id"
    t.text     "notes"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "transactiontype"
  end

  add_index "transactions", ["worker_id"], name: "index_transactions_on_worker_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "week_notes", force: :cascade do |t|
    t.text     "note"
    t.date     "monday"
    t.text     "author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workers", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "mobile"
    t.string   "email"
    t.string   "foreground"
    t.string   "background"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.text     "notes"
    t.boolean  "active"
    t.boolean  "utility"
    t.string   "pronoun"
    t.string   "last_initial"
  end

  create_table "workgroup_memberships", force: :cascade do |t|
    t.integer  "worker_id"
    t.integer  "workgroup_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "workgroup_memberships", ["worker_id"], name: "index_workgroup_memberships_on_worker_id", using: :btree
  add_index "workgroup_memberships", ["workgroup_id"], name: "index_workgroup_memberships_on_workgroup_id", using: :btree

  create_table "workgroups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "milestone_accomplishments", "milestones"
  add_foreign_key "milestone_accomplishments", "workers"
  add_foreign_key "pay_rates", "workers"
  add_foreign_key "shifts", "shift_templates"
  add_foreign_key "shifts", "tasks"
  add_foreign_key "shifts", "workers"
  add_foreign_key "tasks", "workgroups"
  add_foreign_key "transactions", "workers"
  add_foreign_key "workgroup_memberships", "workers"
  add_foreign_key "workgroup_memberships", "workgroups"
end
