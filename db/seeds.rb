# Create a model named TownHealthRecord that will store the available information from the CSV file. Each town in the file should have their own record (i.e. each town has its own row in the database).

#Add a migration for creating the town_health_records table that reflect the fields and data types present in the dataset.

# Once the migration has been created, run rake db:migrate to create the table in the database.

require 'csv'
# @return [Array] array of CSV::Row
def scrub_CSV(filename)
  scrubbed_CSV = []
  scrubbed_headers = nil
  CSV.foreach(filename, headers:true, return_headers: true) do |row|
    if row.header_row?
      scrubbed_headers = scrub_header_row(row)
    else
      scrubbed_fields = scrub_data_row(row)
      # push only if scrubbed_fields != nil
      if !scrubbed_fields.nil?
        scrubbed_CSV.push(CSV::Row.new(scrubbed_headers, scrubbed_fields))
      end
    end
  end
  scrubbed_CSV
end

# @param [CSV::Row] row to be scrubbed
# @return [Array] scrubbed fields
def scrub_data_row(row)
  fields = row.fields
  # assumption: if fields 1-3 are all nil, throw out the row
  # field 0 is populated in some cases but it is still invalid
  if fields[1].nil? && fields[2].nil? && fields[3].nil?
    return nil
  end
  return fields.map { |field|
    if field.nil? || field == 'NA'
      nil
    else
      field = field.strip.gsub(/,|\$/, "")
      if field.match(/^\d+/) && field.include?('.')
        field.to_f
      elsif field.match(/^\d+/)
        field.to_i
      else
        field
      end
    end
  }
end

# @param [CSV::Row] header - header row to be scrubbed
# @return [Array] header array to construct CSV::Row
def scrub_header_row(row)
  # get an array containing strings of all the header names
  headers = row.headers
  nil_count = 0

  return headers.map { |field|
    if field.nil?
      nil_count+=1
      "unk_#{nil_count}"
    else
      # order is important! downcase, remove leading/trailing spaces, replace % with pct, replace spaces with _, remove all non-word characters
      field.downcase.strip.gsub(/%/, "pct").gsub(/\s+/, "_").gsub(/\W+/, "")
    end
  }
end

def populate_db
  filename = Rails.root + "db/data/mass_health_data.csv"
  records = scrub_CSV(filename)
  records.each do |record|
    record = record.to_hash
    if TownHealthRecord.find_by_geography(record['geography']).nil?
      TownHealthRecord.create(record)
    end
  end
end

populate_db
