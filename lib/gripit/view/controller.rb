# frozen_string_literal: true

# auto_register: false

require "gripit/container"

module Gripit
  module View
    class Controller
      extend Dry::Configurable

      setting :renderer
      setting :klass
      setting :include
      setting :fields
      setting :expose, {}

      configure do |config|
        config.renderer = Container["jsonapi.renderer"]
      end

      def renderer
        self.class.config.renderer
      end

      def klass
        self.class.config.klass
      end

      def include
        self.class.config.include
      end

      def expose
        self.class.config.expose
      end

      def call(options)
        renderer.render(
            options[:data],
            class: klass,
            include: include,
            expose: expose.merge(url_support: options[:context].url_support)
        )
      end
    end
  end
end
