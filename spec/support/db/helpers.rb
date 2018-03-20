# frozen_string_literal: true

module Test
  module DatabaseHelpers
    module_function

    def rom
      Gripit::Container["persistence.rom"]
    end

    def db
      Gripit::Container["persistence.db"]
    end
  end
end
