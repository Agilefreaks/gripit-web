# Require the bundler gem and then call Bundler.require to load in all gems
# listed in Gemfile.
require 'bundler'
Bundler.require

require 'rack/csrf'
require './app/api/resources/route_resource'

module GripitWeb
  class App < Sinatra::Base
    set :root, File.dirname(__FILE__)

    enable :logging

    use Rack::Session::Cookie, secret: 'TODO: CHANGE ME'
    use Rack::Csrf, raise: true

    configure :development do
      require 'sinatra/reloader'
      register Sinatra::Reloader
    end

    get '/' do
      { jsonapi: { version: '1.0' } }.to_json
    end

    get '/routes' do
      content_type :json

      renderer = JSONAPI::Serializable::Renderer.new

      routes = [
          {
              id: Random.rand(1000),
              name: "Sibiu-Ploiesti",
              grade: "6c",
              picture: "https://www.summitpost.org/sketch-of-the-climbing-routes/50704",
              tags: %w(Dyno Tech),
              gripped: true
          },
          {
              id: Random.rand(1000),
              name: "Sibiu-PorumbacuDeSus",
              grade: "1",
              picture: "https://www.summitpost.org/rubihorn/281620",
              tags: %w(Tech),
              gripped: false
          },
          {
              id: Random.rand(1000),
              name: "Sibiu-RealMadrid",
              grade: "7b+",
              picture: "https://www.hablayapanama.com/ecotourism/boquete/rock-climbing/",
              tags: %w(Dyno),
              gripped: true
          },
      ]

      renderer.render(
        routes,
        class: {
          Hash: GripitWeb::API::Resources::RouteResource
        }
      ).to_json
    end
  end
end
