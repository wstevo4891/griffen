source 'https://rubygems.org'
ruby '2.2.2'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Bootstrap Sass
gem 'bootstrap-sass', '3.3.4.1'
gem 'compass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# Use Devise for authentication
gem 'devise'
# gem 'devise_zxcvbn'
gem 'symmetric-encryption'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'
# Use AJAX file uploads
gem 'remotipart'
gem 'jquery-fileupload-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use Wicked PDF for generating pdf files
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'

# Use Dropbox for document uploads
gem 'dropbox-sdk'

# Use Progress_Job for progress bars
gem 'delayed_job_active_record'
gem 'progress_job'

# User carrierwave for image uploads
gem 'carrierwave'
gem 'rmagick'

# Use Cocoon for building nested forms
gem 'cocoon'

# Use Zoho for CRM
gem 'rubyzoho'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Heroku armor
gem 'exception_handler', '~> 0.4'
gem 'responders', '~> 2.0'
# gem 'rack-timeout'

# Use Puma for a server
gem 'puma'

group :development do
  gem 'sqlite3'
  gem 'better_errors'
  gem 'meta_request'
  gem 'quiet_assets'
  gem 'guard'
  gem 'guard-livereload', '~> 2.5', require: false
  gem 'rack-livereload'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'dotenv-rails'
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails', '~> 4.5'
  gem 'pry-rescue'
  gem 'pry-stack_explorer'
  gem 'pry-rails'
  gem 'puffing-billy'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'awesome_print', require: 'ap'
end

group :test do
  gem 'faker'
  gem 'capybara'
  gem 'shoulda-matchers'
  gem 'email_spec'  
  gem 'guard-rspec'
  gem 'launchy'
  gem 'vcr'
  gem 'webmock'
  gem 'database_cleaner'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
