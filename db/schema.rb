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

ActiveRecord::Schema.define(version: 20170227133741) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "conversation_memberships", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "conversation_id"
    t.uuid     "user_id"
    t.string   "status"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["conversation_id"], name: "index_conversation_memberships_on_conversation_id", using: :btree
    t.index ["user_id"], name: "index_conversation_memberships_on_user_id", using: :btree
  end

  create_table "conversations", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "dual_id"
    t.uuid     "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dual_id"], name: "index_conversations_on_dual_id", unique: true, using: :btree
  end

  create_table "friendships", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "requester_id"
    t.uuid     "acceptor_id"
    t.string   "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["acceptor_id"], name: "index_friendships_on_acceptor_id", using: :btree
    t.index ["requester_id", "acceptor_id"], name: "index_friendships_on_requester_id_and_acceptor_id", unique: true, using: :btree
    t.index ["requester_id"], name: "index_friendships_on_requester_id", using: :btree
  end

  create_table "sms_messages", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "phone"
    t.string   "ver_code"
    t.string   "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "wechat_openid"
    t.json     "wechat_userinfo"
    t.string   "phone"
    t.string   "air_auth_token",               null: false
    t.string   "friends",         default: [],              array: true
    t.string   "status"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["air_auth_token"], name: "index_users_on_air_auth_token", unique: true, using: :btree
    t.index ["phone"], name: "index_users_on_phone", using: :btree
    t.index ["wechat_openid"], name: "index_users_on_wechat_openid", unique: true, using: :btree
  end

  add_foreign_key "conversation_memberships", "conversations"
  add_foreign_key "conversation_memberships", "users"
  add_foreign_key "conversations", "users", column: "owner_id"
  add_foreign_key "friendships", "users", column: "acceptor_id"
  add_foreign_key "friendships", "users", column: "requester_id"
end
