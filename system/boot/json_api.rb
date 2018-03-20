# frozen_string_literal: true

Gripit::Container.boot :jsonapi, namespace: true do
  init do
    require "plugins/json_api"
    require "jsonapi/serializable"
  end

  start do
    register "renderer", JSONAPI::Serializable::Renderer.new
  end
end
