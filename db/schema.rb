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

ActiveRecord::Schema[8.1].define(version: 2026_07_08_212725) do
  create_table "dmc_colors", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "dmc_code", null: false
    t.string "hex_code", limit: 7, null: false
    t.string "name", null: false
    t.datetime "updated_at", null: false
    t.index ["dmc_code"], name: "index_dmc_colors_on_dmc_code", unique: true
  end

  create_table "inventory_items", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "count", default: 0, null: false
    t.datetime "created_at", null: false
    t.bigint "dmc_color_id", null: false
    t.bigint "owner_id", null: false
    t.string "status", default: "owned", null: false
    t.datetime "updated_at", null: false
    t.index ["dmc_color_id"], name: "index_inventory_items_on_dmc_color_id"
    t.index ["owner_id"], name: "index_inventory_items_on_owner_id"
  end

  create_table "owners", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "inventory_items", "dmc_colors"
  add_foreign_key "inventory_items", "owners"
end
