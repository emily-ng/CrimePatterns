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

ActiveRecord::Schema.define(version: 20161122053106) do

  create_table "arrests_by_state_2005", primary_key: ["state", "age"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "state",                 limit: 45, null: false
    t.string  "age",                   limit: 45, null: false
    t.integer "total_all",                        null: false
    t.integer "violent_crime",                    null: false
    t.integer "property_crime",                   null: false
    t.integer "drug_abuse_violations",            null: false
  end

  create_table "arrests_by_state_2007", primary_key: ["state", "age"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "state",                 limit: 45, null: false
    t.string  "age",                   limit: 45, null: false
    t.integer "total_all",                        null: false
    t.integer "violent_crime",                    null: false
    t.integer "property_crime",                   null: false
    t.integer "drug_abuse_violations",            null: false
  end

  create_table "arrests_by_state_2009", primary_key: ["state", "age"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "state",                 limit: 45, null: false
    t.string  "age",                   limit: 45, null: false
    t.integer "total_all",                        null: false
    t.integer "violent_crime",                    null: false
    t.integer "property_crime",                   null: false
    t.integer "drug_abuse_violations",            null: false
  end

  create_table "arrests_by_state_2011", primary_key: ["state", "age"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "state",                 limit: 45, null: false
    t.string  "age",                   limit: 45, null: false
    t.integer "total_all",                        null: false
    t.integer "violent_crime",                    null: false
    t.integer "property_crime",                   null: false
    t.integer "drug_abuse_violations",            null: false
  end

  create_table "arrests_by_state_2012", primary_key: ["state", "age"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "state",                 limit: 45, null: false
    t.string  "age",                   limit: 45, null: false
    t.integer "total_all",                        null: false
    t.integer "violent_crime",                    null: false
    t.integer "property_crime",                   null: false
    t.integer "drug_abuse_violations",            null: false
  end

  create_table "database_structures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
  end

  create_table "drug_violations", primary_key: ["year", "da_violation"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "year",                    null: false
    t.string  "da_violation", limit: 45, null: false
    t.float   "us_total",     limit: 53, null: false
    t.float   "northeast",    limit: 53, null: false
    t.float   "midwest",      limit: 53, null: false
    t.float   "south",        limit: 53, null: false
    t.float   "west",         limit: 53, null: false
  end

  create_table "state", primary_key: ["name", "year"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "name",         limit: 45, null: false
    t.integer "year",                    null: false
    t.integer "num_agencies",            null: false
    t.integer "est_pop",                 null: false
    t.string  "region",       limit: 45, null: false
  end

end
