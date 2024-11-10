# frozen_string_literal: true

require "rails"

require "modeled_settings"

module ModeledSettings
  module Rails
    # Engine for application-level configuration.
    class Engine < ::Rails::Engine
      isolate_namespace ModeledSettings
    end
  end
end
