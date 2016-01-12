VCR.configure do |config|
  config.cassette_library_dir = "spec/support/http_cache/vcr"
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.preserve_exact_body_bytes do |http_message|
    http_message.body.encoding.name == 'ASCII-8BIT' ||
    !http_message.body.valid_encoding?
  end

  # Only want VCR to intercept requests to external URLs.
  config.ignore_localhost = true
end
