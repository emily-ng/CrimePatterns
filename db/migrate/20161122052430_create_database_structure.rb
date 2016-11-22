class CreateDatabaseStructure < ActiveRecord::Migration[5.0]
  def change
    create_table :database_structures do |t|

    	ActiveRecord::Schema.define(version: 0) do

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


    end
  end
end
