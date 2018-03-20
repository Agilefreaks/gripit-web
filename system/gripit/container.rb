# frozen_string_literal: true

require "dry/web/container"
require "dry/system/components"

module Gripit
  class Container < Dry::Web::Container
    configure do |config|
      config.name = :gripit
      config.root = File.expand_path("../../", __dir__)
      config.listeners = true
      config.default_namespace = "gripit"
      config.auto_register = %w[lib/gripit]
    end

    load_paths! "lib"
  end
end
