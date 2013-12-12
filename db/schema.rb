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

ActiveRecord::Schema.define(version: 20131212034555) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "town_health_records", force: true do |t|
    t.string   "geography"
    t.integer  "total_pop_year_2005"
    t.integer  "age_019_year_2005"
    t.integer  "age_65_year_2005"
    t.integer  "per_capita_income_year_2000"
    t.integer  "persons_living_below_200pct_poverty_year_2000"
    t.decimal  "pct_all_persons_living_below_200pct_poverty_level_year_2000"
    t.decimal  "pct_adequacy_prenatal_care_kotelchuck"
    t.decimal  "pct_csection_deliveries_20052008"
    t.integer  "number_of_infant_deaths_20052008"
    t.decimal  "infant_mortality_rate_deaths_per_1000_live_births_20052008"
    t.decimal  "pct_low_birthweight_20052008"
    t.decimal  "pct_multiple_births_20052008"
    t.decimal  "pct_publicly_financed_prenatal_care_20052008"
    t.decimal  "pct_teen_births_20052008"
    t.string   "unk_1"
    t.string   "unk_2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
