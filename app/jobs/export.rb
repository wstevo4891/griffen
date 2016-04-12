class ExportJob < ProgressJob::Base
  def initialize(file, progress_max)
  	super progress_max: progress_max
  	@file = file
  end

  def perform
  	update_stage('Exporting users')
  	csv_string = CSV.generate do |csv|
  		csv << @file.to_csv
  		update_progress
  	end
  	File.open('path/to/export.csv', 'w') { |f| f.write(csv_string) }
  end
end