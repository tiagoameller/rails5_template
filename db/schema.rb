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

ActiveRecord::Schema.define(version: 2022_05_23_090916) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "banners", force: :cascade do |t|
    t.integer "code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_banners_on_code", unique: true
    t.index ["name"], name: "index_banners_on_name"
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "yes_or_not", default: false
    t.date "bod"
  end

  create_table "colors", force: :cascade do |t|
    t.integer "code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_colors_on_code", unique: true
    t.index ["name"], name: "index_colors_on_name"
  end

  create_table "item_colors", force: :cascade do |t|
    t.integer "item_id"
    t.integer "color_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_prices", force: :cascade do |t|
    t.integer "item_id"
    t.integer "stamping_id"
    t.integer "from_size"
    t.integer "to_size"
    t.decimal "price1", precision: 5, scale: 2, default: "0.0"
    t.decimal "price2", precision: 5, scale: 2, default: "0.0"
    t.decimal "price3", precision: 5, scale: 2, default: "0.0"
    t.decimal "pe1", precision: 5, scale: 2, default: "0.0"
    t.decimal "pe2", precision: 5, scale: 2, default: "0.0"
    t.decimal "pe3", precision: 5, scale: 2, default: "0.0"
    t.decimal "cost", precision: 5, scale: 2, default: "0.0"
    t.decimal "shipping", precision: 5, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_sizes", force: :cascade do |t|
    t.integer "item_id"
    t.integer "size_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_stampings", force: :cascade do |t|
    t.integer "item_id"
    t.integer "stamping_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer "code"
    t.string "ref"
    t.string "name"
    t.integer "status", default: 0
    t.integer "min_sale_units", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_items_on_code", unique: true
    t.index ["name"], name: "index_items_on_name"
    t.index ["ref"], name: "index_items_on_ref"
  end

  create_table "sizes", force: :cascade do |t|
    t.integer "code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_sizes_on_code", unique: true
    t.index ["name"], name: "index_sizes_on_name"
  end

  create_table "stampings", force: :cascade do |t|
    t.integer "code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_stampings_on_code", unique: true
    t.index ["name"], name: "index_stampings_on_name"
  end

  create_table "suppliers", force: :cascade do |t|
    t.integer "code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_suppliers_on_code"
    t.index ["name"], name: "index_suppliers_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.integer "admin_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "locale", default: "ca"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
