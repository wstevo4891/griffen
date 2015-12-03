source 'https://rubygems.org'
ruby '2.2.2'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', group: :development
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Bootstrap Sass
gem 'bootstrap-sass', '3.3.4.1'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use Wicked PDF for generating pdf files
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'

# Use Dropbox for Cloud Database
gem 'dropbox-sdk'
gem 'remotipart'

# User carrierwave for image uploads
gem 'carrierwave'
gem 'rmagick'

# Use Zoho for CRM
gem 'rubyzoho'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Heroku armor
gem 'exception_handler', '~> 0.4'
gem 'responders', '~> 2.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  gem 'dotenv-rails'
  
  gem 'rspec-rails', '>= 2.0.1'
  gem 'factory_girl_rails'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'faker'
  gem 'capybara'
  gem 'guard-rspec'
  gem 'launchy'
end

group :production do
# Use PostGreSQL as the production database
  gem 'pg'
  gem 'rails_12factor'
end
