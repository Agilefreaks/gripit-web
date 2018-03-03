require 'jsonapi/serializable'

module GripitWeb
  module API
    module Resources
      class RouteResource < JSONAPI::Serializable::Resource
        type 'route'
        id { @object[:id] }

        attribute :name do
          @object[:name]
        end

        attribute :grade do
          @object[:grade]
        end

        attribute :picture_url do
          @object[:picture]
        end

        attribute :tags do
          @object[:tags]
        end

        attribute :gripped do
          @object[:gripped]
        end
      end
    end
  end
end
