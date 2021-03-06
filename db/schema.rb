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

ActiveRecord::Schema.define(version: 20170822144749) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "baskets", force: :cascade do |t|
    t.integer "user_id"
    t.integer "cloth_id"
    t.index ["cloth_id"], name: "index_baskets_on_cloth_id", using: :btree
    t.index ["user_id"], name: "index_baskets_on_user_id", using: :btree
  end

  create_table "clothes", force: :cascade do |t|
    t.string "name",                      null: false
    t.string "description"
    t.string "color"
    t.float  "price",                     null: false
    t.string "tags",         default: [],              array: true
    t.string "brand",                     null: false
    t.string "material"
    t.string "sizes",                                  array: true
    t.string "images_urls",                            array: true
    t.string "gender"
    t.string "provider_url"
    t.string "provider_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "size",                   default: [],              array: true
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "wishes", force: :cascade do |t|
    t.integer "user_id"
    t.string  "tags",        default: [], array: true
    t.string  "color"
    t.string  "gender"
    t.float   "price"
    t.string  "description"
    t.string  "brand"
    t.string  "name"
    t.string  "material"
    t.index ["user_id"], name: "index_wishes_on_user_id", using: :btree
  end

  add_foreign_key "baskets", "users"
  add_foreign_key "wishes", "users"
end
