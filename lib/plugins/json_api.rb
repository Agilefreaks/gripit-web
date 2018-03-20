# frozen_string_literal: true

require "roda"

class Roda
  module RodaPlugins
    module JsonApi
      def self.load_dependencies(app)
        app.plugin :flow
      end

      module InstanceMethods
        def view_context
          self.class["view.context"].with(view_context_options)
        end

        def view_context_options
          {}
        end

        def view_key(name)
          "views.#{name}"
        end
      end

      module RequestMethods
        def jsonapi(name, options = {})
          options = { context: scope.view_context }.merge(options)
          on to: scope.view_key(name), call_with: [options]
        end
      end
    end

    register_plugin :json_api, JsonApi
  end
end
