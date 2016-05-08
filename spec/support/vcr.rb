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

  config.default_cassette_options = { allow_playback_repeats: true, match_requests_on: [:method, :uri, :headers] }


  config.debug_logger = File.open(Rails.root.join('log/vcr.log'), 'w')
end
