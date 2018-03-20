# frozen_string_literal: true

require "dry/web/roda/application"
require_relative "container"
require "memoizable"
require "gripit/url_support"

module Gripit
  class Web < Dry::Web::Roda::Application
    include Memoizable

    configure do |config|
      config.container = Container
      config.routes = "web/routes"
    end

    opts[:root] = Pathname(__FILE__).join("../..").realpath.dirname

    plugin :json_api
    plugin :json, content_type: "application/vnd.api+json"
    plugin :json_parser, content_type: "application/vnd.api+json"
    plugin :error_handler
    plugin :multi_route
    plugin :request_headers

    route do |r|
      r.multi_route

      r.root do
        { jsonapi: { version: "1.0" } }
      end
    end

    error do |e|
      self.class[:rack_monitor].instrument(:error, exception: e)
      raise e
    end

    # Request-specific options for dry-view context object
    def view_context_options
      {
          url_support: Gripit::UrlSupport.new(env, current_user)
      }
    end

    load_routes!
  end
end
