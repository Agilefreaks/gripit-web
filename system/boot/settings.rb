# frozen_string_literal: true

Gripit::Container.boot :settings, from: :system do
  before :init do
    require "types"
  end

  settings do
    key :postgresql_url, Types::Strict::String.constrained(filled: true)
  end
end
