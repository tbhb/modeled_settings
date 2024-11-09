# frozen_string_literal: true

require "rails"

module ActiveModel
  module Config
    module Rails
      # Engine for application-level configuration.
      class Engine < ::Rails::Engine
        isolate_namespace ActiveModel::Config
      end
    end
  end
end
