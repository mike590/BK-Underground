source 'https://rubygems.org'

ruby '2.2.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'

gem 'sass-rails'
gem 'haml-rails'
gem 'coffee-rails'
gem 'compass-rails'

# gem to ease calling liverail
gem 'rest-client'
#  queueing library
gem 'delayed_job_mongoid'
# gem to schedule worker processes, non-cron
gem 'clockwork'
# gem to use environment variables for config variables
gem 'figaro'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'

group :development do
  gem 'letter_opener'
  gem 'letter_opener_web'
end

group :development, :test do
  # REPL
  gem 'pry-byebug'
  gem 'pry-remote'
  gem 'pry-rescue'
  gem 'pry-stack_explorer'
  gem 'pry-doc'
  gem 'pry-docmore'
  gem 'pry-rails'
  # Observers
  gem 'rails-observers'
  # Unit Testing Kit
  gem 'rspec-rails'
  # To replicate models in testing
  gem 'factory_girl_rails'
  # Integration Testing Kit
  gem 'capybara'
  gem 'capybara-angular'
  # Driver used by capybara to open up browsers and send requests
  gem "selenium-webdriver"
  # used to manage and clean testing database
  gem 'database_cleaner'
end

group :test do
  # Webmock mimics API responses in testing
  gem 'webmock'
end

gem 'sprockets-rails'
# Use mongodb as the database
gem 'mongoid', '~> 5.1.0'

# Device for user authentication
gem 'devise'
# Roles and permissions
gem 'cancan'

# Rails admin
gem 'rails_admin' , git: 'https://github.com/sferik/rails_admin.git'
# An extension to rails admin, enables impersonate
gem 'rails_admin_impersonate'
# Adds pagination capabilities
gem 'will_paginate_mongoid'
# Forms helpers
gem 'simple_form'
# Adds java like Enumeration
gem 'enumerize'
# Excel generator
gem 'axlsx'
gem 'axlsx_rails'
# PDF Generator
gem 'prawn'
gem 'prawn-table'
# Auditing
gem 'mongoid-audit'
