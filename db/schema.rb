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

ActiveRecord::Schema[8.0].define(version: 2025_05_19_051216) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "maintenance_tasks_runs", force: :cascade do |t|
    t.string "task_name", null: false
    t.datetime "started_at"
    t.datetime "ended_at"
    t.float "time_running", default: 0.0, null: false
    t.bigint "tick_count", default: 0, null: false
    t.bigint "tick_total"
    t.string "job_id"
    t.string "cursor"
    t.string "status", default: "enqueued", null: false
    t.string "error_class"
    t.string "error_message"
    t.text "backtrace"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "arguments"
    t.integer "lock_version", default: 0, null: false
    t.text "metadata"
    t.index ["task_name", "status", "created_at"], name: "index_maintenance_tasks_runs", order: { created_at: :desc }
  end
end
