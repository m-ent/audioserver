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

ActiveRecord::Schema.define(version: 20150203155058) do

  create_table "audiograms", force: true do |t|
    t.integer  "patient_id"
    t.integer  "examiner_id"
    t.datetime "examdate"
    t.string   "comment"
    t.string   "image_location"
    t.float    "ac_rt_125"
    t.float    "ac_rt_250"
    t.float    "ac_rt_500"
    t.float    "ac_rt_1k"
    t.float    "ac_rt_2k"
    t.float    "ac_rt_4k"
    t.float    "ac_rt_8k"
    t.float    "ac_lt_125"
    t.float    "ac_lt_250"
    t.float    "ac_lt_500"
    t.float    "ac_lt_1k"
    t.float    "ac_lt_2k"
    t.float    "ac_lt_4k"
    t.float    "ac_lt_8k"
    t.float    "bc_rt_250"
    t.float    "bc_rt_500"
    t.float    "bc_rt_1k"
    t.float    "bc_rt_2k"
    t.float    "bc_rt_4k"
    t.float    "bc_rt_8k"
    t.float    "bc_lt_250"
    t.float    "bc_lt_500"
    t.float    "bc_lt_1k"
    t.float    "bc_lt_2k"
    t.float    "bc_lt_4k"
    t.float    "bc_lt_8k"
    t.boolean  "ac_rt_125_scaleout"
    t.boolean  "ac_rt_250_scaleout"
    t.boolean  "ac_rt_500_scaleout"
    t.boolean  "ac_rt_1k_scaleout"
    t.boolean  "ac_rt_2k_scaleout"
    t.boolean  "ac_rt_4k_scaleout"
    t.boolean  "ac_rt_8k_scaleout"
    t.boolean  "ac_lt_125_scaleout"
    t.boolean  "ac_lt_250_scaleout"
    t.boolean  "ac_lt_500_scaleout"
    t.boolean  "ac_lt_1k_scaleout"
    t.boolean  "ac_lt_2k_scaleout"
    t.boolean  "ac_lt_4k_scaleout"
    t.boolean  "ac_lt_8k_scaleout"
    t.boolean  "bc_rt_250_scaleout"
    t.boolean  "bc_rt_500_scaleout"
    t.boolean  "bc_rt_1k_scaleout"
    t.boolean  "bc_rt_2k_scaleout"
    t.boolean  "bc_rt_4k_scaleout"
    t.boolean  "bc_rt_8k_scaleout"
    t.boolean  "bc_lt_250_scaleout"
    t.boolean  "bc_lt_500_scaleout"
    t.boolean  "bc_lt_1k_scaleout"
    t.boolean  "bc_lt_2k_scaleout"
    t.boolean  "bc_lt_4k_scaleout"
    t.boolean  "bc_lt_8k_scaleout"
    t.float    "mask_ac_rt_125"
    t.float    "mask_ac_rt_250"
    t.float    "mask_ac_rt_500"
    t.float    "mask_ac_rt_1k"
    t.float    "mask_ac_rt_2k"
    t.float    "mask_ac_rt_4k"
    t.float    "mask_ac_rt_8k"
    t.float    "mask_ac_lt_125"
    t.float    "mask_ac_lt_250"
    t.float    "mask_ac_lt_500"
    t.float    "mask_ac_lt_1k"
    t.float    "mask_ac_lt_2k"
    t.float    "mask_ac_lt_4k"
    t.float    "mask_ac_lt_8k"
    t.float    "mask_bc_rt_250"
    t.float    "mask_bc_rt_500"
    t.float    "mask_bc_rt_1k"
    t.float    "mask_bc_rt_2k"
    t.float    "mask_bc_rt_4k"
    t.float    "mask_bc_rt_8k"
    t.float    "mask_bc_lt_250"
    t.float    "mask_bc_lt_500"
    t.float    "mask_bc_lt_1k"
    t.float    "mask_bc_lt_2k"
    t.float    "mask_bc_lt_4k"
    t.float    "mask_bc_lt_8k"
    t.string   "mask_ac_rt_125_type"
    t.string   "mask_ac_rt_250_type"
    t.string   "mask_ac_rt_500_type"
    t.string   "mask_ac_rt_1k_type"
    t.string   "mask_ac_rt_2k_type"
    t.string   "mask_ac_rt_4k_type"
    t.string   "mask_ac_rt_8k_type"
    t.string   "mask_ac_lt_125_type"
    t.string   "mask_ac_lt_250_type"
    t.string   "mask_ac_lt_500_type"
    t.string   "mask_ac_lt_1k_type"
    t.string   "mask_ac_lt_2k_type"
    t.string   "mask_ac_lt_4k_type"
    t.string   "mask_ac_lt_8k_type"
    t.string   "mask_bc_rt_250_type"
    t.string   "mask_bc_rt_500_type"
    t.string   "mask_bc_rt_1k_type"
    t.string   "mask_bc_rt_2k_type"
    t.string   "mask_bc_rt_4k_type"
    t.string   "mask_bc_rt_8k_type"
    t.string   "mask_bc_lt_250_type"
    t.string   "mask_bc_lt_500_type"
    t.string   "mask_bc_lt_1k_type"
    t.string   "mask_bc_lt_2k_type"
    t.string   "mask_bc_lt_4k_type"
    t.string   "mask_bc_lt_8k_type"
    t.boolean  "manual_input"
    t.string   "audiometer"
    t.string   "hospital"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "audiograms", ["examiner_id"], name: "index_audiograms_on_examiner_id"
  add_index "audiograms", ["patient_id"], name: "index_audiograms_on_patient_id"

  create_table "examiners", force: true do |t|
    t.string   "worker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: true do |t|
    t.string   "hp_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tympanograms", force: true do |t|
    t.integer  "patient_id"
    t.integer  "examiner_id"
    t.datetime "examdate"
    t.string   "comment"
    t.string   "image_location"
    t.string   "impedancemeter"
    t.string   "hospital"
    t.float    "rt_pvt"
    t.float    "rt_sc"
    t.integer  "rt_peak"
    t.float    "rt_interval"
    t.text     "rt_data"
    t.integer  "rt_data_length"
    t.float    "lt_pvt"
    t.float    "lt_sc"
    t.integer  "lt_peak"
    t.float    "lt_interval"
    t.text     "lt_data"
    t.integer  "lt_data_length"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tympanograms", ["examiner_id"], name: "index_tympanograms_on_examiner_id"
  add_index "tympanograms", ["patient_id"], name: "index_tympanograms_on_patient_id"

end
