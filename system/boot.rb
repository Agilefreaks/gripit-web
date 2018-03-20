# frozen_string_literal: true

require "bundler/setup"

begin
  require "pry-byebug"
  require "awesome_print"

  Pry.config.print { |out, val| out.pp val.ai }
rescue LoadError => e
  p e
end

require_relative "gripit/container"

Gripit::Container.finalize!

require_relative "gripit/web"
