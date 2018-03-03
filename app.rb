# Require the bundler gem and then call Bundler.require to load in all gems
# listed in Gemfile.
require 'bundler'
Bundler.require

get '/' do
  { jsonapi: { version: "1.0"} }
end