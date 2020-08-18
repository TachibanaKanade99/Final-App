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

ActiveRecord::Schema.define(version: 2020_08_18_063025) do

  create_table "album_tables", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title", limit: 140, null: false
    t.string "description", limit: 300, null: false
    t.string "sharing_mode", null: false
  end

  create_table "photo_tables", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title", limit: 140, null: false
    t.string "description", limit: 300, null: false
    t.string "sharing_mode", null: false
  end

  create_table "user_tables", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "first_name", limit: 25, null: false
    t.string "last_name", limit: 25, null: false
    t.string "email", null: false
    t.string "password", limit: 64, null: false
    t.index ["email"], name: "index_user_tables_on_email", unique: true
    t.index ["first_name"], name: "index_user_tables_on_first_name"
    t.index ["last_name"], name: "index_user_tables_on_last_name"
    t.index ["password"], name: "index_user_tables_on_password"
  end

end
