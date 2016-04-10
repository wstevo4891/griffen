require 'ruby_zoho'

RubyZoho.configure do |config|
  config.api_key = ENV["ZOHO_API_KEY"]
  config.cache_fields = true
end
