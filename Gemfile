# frozen_string_literal: true

ruby '2.5.0'

source 'https://rubygems.org'

gem 'sinatra'
gem 'json'
gem 'jsonapi-rb'
gem 'rack_csrf'

# When developing an app locally you can use SQLite which is a relational
# database stored in a file. It's easy to set up and just fine for most
# development situations.
group :development do
  gem 'pry'
  gem 'sinatra-reloader'
  # Enforce standard code formatting
  gem 'rubocop', require: false
end

# Heroku uses Postgres however, so we tell the Gemfile to use Postgres
# in production instead of SQLite.
group :production do
end
