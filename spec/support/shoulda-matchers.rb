Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    
    # Choose one or more libraries:
    # with.library :active_record
    # with.library :active_model
    # with.library :action_controller
    # Or, choose the following (which implies all of the above):
    with.library :rails
  end
end
