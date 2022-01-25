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

ActiveRecord::Schema.define(version: 20220123152201) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "code",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "contract_products", force: :cascade do |t|
    t.integer  "contract_id"
    t.integer  "product_id"
    t.string   "serial_number"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "contract_products", ["contract_id"], name: "index_contract_products_on_contract_id", using: :btree
  add_index "contract_products", ["product_id"], name: "index_contract_products_on_product_id", using: :btree

  create_table "contracts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "service_level_agreement_id"
    t.datetime "sla_valid_start_date"
    t.datetime "sla_valid_end_date"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "reference"
  end

  add_index "contracts", ["service_level_agreement_id"], name: "index_contracts_on_service_level_agreement_id", using: :btree
  add_index "contracts", ["user_id"], name: "index_contracts_on_user_id", using: :btree

  create_table "notes", force: :cascade do |t|
    t.integer  "ticket_id"
    t.integer  "user_id"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "notes", ["ticket_id"], name: "index_notes_on_ticket_id", using: :btree
  add_index "notes", ["user_id"], name: "index_notes_on_user_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "code",        null: false
    t.text     "description"
    t.string   "model"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "qa_categories", force: :cascade do |t|
    t.string   "code",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "qas", force: :cascade do |t|
    t.integer  "qa_category_id"
    t.text     "problem",        null: false
    t.text     "solution",       null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "qas", ["qa_category_id"], name: "index_qas_on_qa_category_id", using: :btree

  create_table "service_level_agreements", force: :cascade do |t|
    t.string   "code",           null: false
    t.text     "description"
    t.integer  "business_days"
    t.integer  "business_hours"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "stat_technicians", force: :cascade do |t|
    t.string   "name"
    t.date     "this_date"
    t.integer  "assigned"
    t.integer  "solved"
    t.integer  "transferred"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "stat_tickets", force: :cascade do |t|
    t.string   "code"
    t.integer  "no_of_tickets"
    t.string   "record_type"
    t.date     "this_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "ticket_priorities", force: :cascade do |t|
    t.string   "code",           null: false
    t.text     "description"
    t.integer  "business_days"
    t.integer  "business_hours"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "ticket_status_codes", force: :cascade do |t|
    t.string   "code",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "ticket_types", force: :cascade do |t|
    t.string   "code",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "contract_product_id"
    t.integer  "ticket_priority_id"
    t.integer  "ticket_status_code_id"
    t.integer  "ticket_type_id"
    t.text     "problem_description",   null: false
    t.text     "solution_description"
    t.datetime "assigned_at"
    t.datetime "closed_at"
    t.datetime "to_be_solved_at"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "technician_id"
    t.string   "reference"
    t.integer  "category_id"
    t.integer  "product_id"
    t.string   "model"
    t.string   "serial_number"
  end

  add_index "tickets", ["category_id"], name: "index_tickets_on_category_id", using: :btree
  add_index "tickets", ["contract_product_id"], name: "index_tickets_on_contract_product_id", using: :btree
  add_index "tickets", ["product_id"], name: "index_tickets_on_product_id", using: :btree
  add_index "tickets", ["reference"], name: "index_tickets_on_reference", using: :btree
  add_index "tickets", ["ticket_priority_id"], name: "index_tickets_on_ticket_priority_id", using: :btree
  add_index "tickets", ["ticket_status_code_id"], name: "index_tickets_on_ticket_status_code_id", using: :btree
  add_index "tickets", ["ticket_type_id"], name: "index_tickets_on_ticket_type_id", using: :btree
  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id", using: :btree

  create_table "user_notifications", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "ticket_id"
    t.string   "notification_type"
    t.integer  "send_email"
    t.integer  "send_sms"
    t.datetime "email_sent_at"
    t.datetime "sms_sent_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "user_types", force: :cascade do |t|
    t.string   "code",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "user_type_id"
    t.string   "name"
    t.string   "mobile"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["user_type_id"], name: "index_users_on_user_type_id", using: :btree

  add_foreign_key "contract_products", "contracts"
  add_foreign_key "contract_products", "products"
  add_foreign_key "contracts", "service_level_agreements"
  add_foreign_key "contracts", "users"
  add_foreign_key "notes", "tickets"
  add_foreign_key "notes", "users"
  add_foreign_key "products", "categories"
  add_foreign_key "qas", "qa_categories"
  add_foreign_key "tickets", "contract_products"
  add_foreign_key "tickets", "ticket_priorities"
  add_foreign_key "tickets", "ticket_status_codes"
  add_foreign_key "tickets", "ticket_types"
  add_foreign_key "tickets", "users"
  add_foreign_key "users", "user_types"
end
