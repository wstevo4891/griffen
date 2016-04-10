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

ActiveRecord::Schema.define(version: 20160107195803) do

  create_table "access_tokens", force: :cascade do |t|
    t.string   "locator",          null: false
    t.text     "encrypted_secret", null: false
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "access_tokens", ["locator"], name: "index_access_tokens_on_locator", unique: true
  add_index "access_tokens", ["user_id"], name: "index_access_tokens_on_user_id"

  create_table "aches", force: :cascade do |t|
    t.string   "bmn"
    t.string   "iso"
    t.string   "isoid"
    t.string   "agentname"
    t.string   "legalname"
    t.string   "taxid"
    t.string   "dba"
    t.string   "dbaddress"
    t.string   "maddress"
    t.string   "dbacity"
    t.string   "mcity"
    t.string   "dbastate"
    t.string   "dbazip"
    t.string   "mstate"
    t.string   "mzip"
    t.string   "bphone"
    t.string   "bfax"
    t.string   "contact"
    t.string   "title"
    t.string   "ownertype"
    t.string   "goodstype"
    t.string   "totalbustime"
    t.string   "locbustime"
    t.string   "webaddress"
    t.string   "email"
    t.string   "pname"
    t.string   "pphone"
    t.string   "ptitle"
    t.string   "pequity"
    t.string   "paddress"
    t.string   "pdob"
    t.string   "pcity"
    t.string   "pssn"
    t.string   "pstate"
    t.string   "pzip"
    t.string   "pdlicense"
    t.string   "drate"
    t.string   "tfee"
    t.string   "msfee"
    t.string   "mminfee"
    t.string   "termtype"
    t.string   "msig"
    t.string   "mdate"
    t.string   "csig"
    t.string   "cdate"
    t.string   "appby"
    t.string   "apptitle"
    t.string   "appdate"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "aches", ["user_id"], name: "index_aches_on_user_id"

  create_table "admins", force: :cascade do |t|
    t.string   "email",               default: "",    null: false
    t.string   "encrypted_password",  default: "",    null: false
    t.boolean  "god_mode",            default: false
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true

  create_table "applications", force: :cascade do |t|
    t.string   "legalname"
    t.string   "dba"
    t.string   "address"
    t.string   "baddress"
    t.string   "city"
    t.string   "state"
    t.string   "bcity"
    t.string   "bstate"
    t.string   "zip"
    t.string   "bzip"
    t.string   "phone"
    t.string   "fax"
    t.string   "bphone"
    t.string   "bfax"
    t.string   "ftin"
    t.string   "email"
    t.string   "contact"
    t.string   "oname"
    t.string   "dob"
    t.string   "ssn"
    t.string   "ophone"
    t.string   "oaddress"
    t.string   "ocity"
    t.string   "ostate"
    t.string   "ozip"
    t.string   "avgt"
    t.string   "monv"
    t.string   "maxta"
    t.string   "qc"
    t.string   "tz"
    t.string   "pref"
    t.string   "prefn"
    t.string   "cw"
    t.string   "pl"
    t.string   "osig"
    t.string   "date"
    t.string   "opn"
    t.string   "sasig"
    t.string   "agentid"
    t.string   "iso"
    t.string   "dialup"
    t.string   "dumi"
    t.string   "dualcom"
    t.string   "dcmi"
    t.string   "msf12mi"
    t.string   "mi610"
    t.string   "mcfmi"
    t.string   "msf8mi"
    t.string   "carch"
    t.string   "carchmi"
    t.string   "confmi"
    t.string   "incrmi"
    t.string   "billmail"
    t.string   "billosig"
    t.string   "billdate"
    t.string   "billpn"
    t.string   "bankname"
    t.string   "bankaccount"
    t.string   "bankphone"
    t.string   "mtosig"
    t.string   "mtot"
    t.string   "mtdate"
    t.string   "mtpn"
    t.string   "mtsasig"
    t.string   "mtagentid"
    t.string   "mtiso"
    t.string   "yname"
    t.string   "fname"
    t.string   "faddress"
    t.string   "fcity"
    t.string   "fstate"
    t.string   "fzip"
    t.string   "fphone"
    t.string   "facc"
    t.string   "frn"
    t.string   "fan"
    t.string   "atype"
    t.string   "coname"
    t.string   "coatt"
    t.string   "coaddress"
    t.string   "cocity"
    t.string   "costate"
    t.string   "cozip"
    t.string   "cophone"
    t.string   "comail"
    t.string   "cosig"
    t.string   "codate"
    t.string   "verby"
    t.string   "appby"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "voidcheck"
    t.string   "dlicense"
  end

  add_index "applications", ["user_id"], name: "index_applications_on_user_id"

  create_table "documents", force: :cascade do |t|
    t.string   "name"
    t.string   "business"
    t.string   "email"
    t.string   "phone"
    t.string   "irsidn"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "buslicense"
    t.string   "bpra"
    t.string   "artinc"
    t.string   "certform"
    t.string   "opagree"
    t.string   "stockcert"
    t.string   "llclist"
    t.string   "shlist"
    t.string   "combuslicense"
    t.string   "combpra"
  end

  add_index "documents", ["user_id"], name: "index_documents_on_user_id"

  create_table "members", force: :cascade do |t|
    t.string   "mname"
    t.string   "memid"
    t.string   "memid_cache"
    t.integer  "document_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "members", ["document_id"], name: "index_members_on_document_id"

  create_table "orders", force: :cascade do |t|
    t.string   "name"
    t.string   "business"
    t.string   "email"
    t.string   "phone"
    t.string   "product"
    t.string   "payment"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_url"
    t.decimal  "price",       precision: 8, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "shareholders", force: :cascade do |t|
    t.string   "sname"
    t.string   "shid"
    t.string   "shid_cache"
    t.integer  "document_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "shareholders", ["document_id"], name: "index_shareholders_on_document_id"

  create_table "users", force: :cascade do |t|
    t.string   "firstname",              default: "", null: false
    t.string   "lastname",               default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "business",               default: "", null: false
    t.string   "phone",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true

end
