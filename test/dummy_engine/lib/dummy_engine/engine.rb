# frozen_string_literal: true

require "rails"

module DummyEngine
  class Engine < ::Rails::Engine
    isolate_namespace DummyEngine
  end
end
