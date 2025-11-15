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

ActiveRecord::Schema[8.0].define(version: 2025_11_15_123607) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "mobile_app_projects", force: :cascade do |t|
    t.string "store_link"
    t.string "os"
    t.text "tech_used"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "thumbnail"
    t.string "projectable_type", null: false
    t.bigint "projectable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["projectable_type", "projectable_id"], name: "index_projects_on_projectable"
  end

  create_table "unreal_projects", force: :cascade do |t|
    t.string "engine_version"
    t.string "download_url"
    t.string "platform"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "web_dev_projects", force: :cascade do |t|
    t.string "github_url"
    t.string "live_url"
    t.text "tech_stack"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
