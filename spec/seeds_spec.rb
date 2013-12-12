require "spec_helper"
require "#{Rails.root}/db/seeds.rb"

describe CSV do
  before(:all) do
    @datafile = Rails.root + "db/data/mass_health_data.csv"
  end

  it 'should scrub a header row' do
    header = nil
    CSV.foreach(@datafile, headers:true, return_headers: true) do |row|
      header = row
      break
    end
    expect(scrub_header_row(header)).to eql(["geography", "total_pop_year_2005", "age_019_year_2005", "age_65_year_2005", "per_capita_income_year_2000", "persons_living_below_200pct_poverty_year_2000", "pct_all_persons_living_below_200pct_poverty_level_year_2000", "pct_adequacy_prenatal_care_kotelchuck", "pct_csection_deliveries_20052008", "number_of_infant_deaths_20052008", "infant_mortality_rate_deaths_per_1000_live_births_20052008", "pct_low_birthweight_20052008", "pct_multiple_births_20052008", "pct_publicly_financed_prenatal_care_20052008", "pct_teen_births_20052008", "unk_1", "unk_2"])
  end

  it "should scrub csv" do
    scrubbed_CSV = scrub_CSV(@datafile)
    # last row should be massachusetts total
    # rows after are garbage
    expect(scrubbed_CSV[-1].to_hash['geography']).to eql('Massachusetts Total')
    # should remove comma from data fields
    expect(scrubbed_CSV[0].to_hash["total_pop_year_2005"]).to eql(16305)
    #should remove $ sign from data fields
    expect(scrubbed_CSV[0].to_hash["per_capita_income_year_2000"]).to eql(23380)
    # should replace 'NA' with nil
    expect(scrubbed_CSV[2].to_hash["infant_mortality_rate_deaths_per_1000_live_births_20052008"]).to eql(nil)
    #
    expect(scrubbed_CSV[0].to_hash["pct_low_birthweight_20052008"]).to eql(8.16)
  end
end
