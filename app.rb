# Require the bundler gem and then call Bundler.require to load in all gems
# listed in Gemfile.
require 'bundler'
Bundler.require

require 'rack/csrf'

module GripitWeb
  class App < Sinatra::Base
    set :root, File.dirname(__FILE__)

    enable :logging

    use Rack::Session::Cookie, :secret => "TODO: CHANGE ME"
    use Rack::Csrf, :raise => true

    configure :development do
      require "sinatra/reloader"
      register Sinatra::Reloader
    end

    get "/" do
      { jsonapi: { version: "1.0" } }.to_json
    end

    get "/" do
    end
  end
end