if Rails.env.test?
  CarrierWave.configure do |config|
  	config.storage = :file
    config.enable_processing = false
  end

  ImageUploader

  CarrierWave::Uploader::Base.descendants.each do |klass|
  	next if klass.anonymous?
  	klass.class_eval do
  	  def cache_dir
  	  	"#{Rails.root}/spec/support/uploads/tmp"
  	  end

  	  def store_dir
  	  	"#{Rails.root}/spec/support/uploads/#{mounted_as}/#{model}"
  	  end
  	end
  end
end