# frozen_string_literal: true

require "active_support"
require "active_support/concern"

require_relative "modeled_settings/version"
require_relative "modeled_settings/deprecator"

module ModeledSettings
  autoload :Model, "modeled_settings/model"
end
