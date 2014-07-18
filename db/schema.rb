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

ActiveRecord::Schema.define(version: 20140718224841) do

  create_table "pa_requests", force: true do |t|
    t.integer  "prescription_id"
    t.boolean  "urgent"
    t.string   "form_id"
    t.string   "state"
    t.boolean  "sent"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cmm_token"
    t.string   "cmm_link"
    t.string   "cmm_id"
    t.string   "cmm_workflow_status"
  end

  add_index "pa_requests", ["prescription_id"], name: "index_pa_requests_on_prescription_id"

  create_table "patients", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "date_of_birth"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pharmacies", force: true do |t|
    t.string   "name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "fax"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "zip"
  end

  create_table "prescriptions", force: true do |t|
    t.string   "drug_number"
    t.integer  "quantity"
    t.string   "frequency"
    t.integer  "refills"
    t.boolean  "dispense_as_written"
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "drug_name"
    t.string   "formulary_status"
    t.datetime "date_prescribed"
    t.boolean  "active"
    t.integer  "pharmacy_id"
  end

  add_index "prescriptions", ["patient_id"], name: "index_prescriptions_on_patient_id"
  add_index "prescriptions", ["pharmacy_id"], name: "index_prescriptions_on_pharmacy_id"

end
