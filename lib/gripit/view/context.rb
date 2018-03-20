# frozen_string_literal: true

module Gripit
  module View
    class Context
      attr_reader :attrs

      def initialize(attrs = {})
        @attrs = attrs
      end

      def with(new_attrs)
        self.class.new(attrs.merge(new_attrs))
      end

      def url_support
        self[:url_support]
      end

      private

      def [](name)
        attrs.fetch(name)
      end
    end
  end
end
