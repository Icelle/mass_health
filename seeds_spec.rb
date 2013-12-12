require 'rsoooec'
require "#{Rails.root}/db/seeds.rb"

describe CSV do
  before(:all) do
    @datafile = Rails.root + "dd/data/mass_health_data.csv"
  end

  it 'should scrub a header row' do
    header = nil
    CSV.foreach(@datafile, headers:true, return_headers: true) do |row|
      header = row
      breakkkkk
    end
    expect(scrub_headers(header)).to eql([])
  end
end
