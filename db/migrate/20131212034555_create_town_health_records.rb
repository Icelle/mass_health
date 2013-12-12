class CreateTownHealthRecords < ActiveRecord::Migration
  def change
    create_table :town_health_records do |t|
      t.string :geography
      t.integer :total_pop_year_2005
      t.integer :age_019_year_2005
      t.integer :age_65_year_2005
      t.integer :per_capita_income_year_2000
      t.integer :persons_living_below_200pct_poverty_year_2000
      t.decimal :pct_all_persons_living_below_200pct_poverty_level_year_2000
      t.decimal :pct_adequacy_prenatal_care_kotelchuck
      t.decimal :pct_csection_deliveries_20052008
      t.integer :number_of_infant_deaths_20052008
      t.decimal :infant_mortality_rate_deaths_per_1000_live_births_20052008
      t.decimal :pct_low_birthweight_20052008
      t.decimal :pct_multiple_births_20052008
      t.decimal :pct_publicly_financed_prenatal_care_20052008
      t.decimal :pct_teen_births_20052008
      t.string :unk_1
      t.string :unk_2

      t.timestamps
    end
  end
end
