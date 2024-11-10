# frozen_string_literal: true

require "active_support"
require "active_support/concern"

require_relative "config/version"
require_relative "config/deprecator"

module ActiveModel
  module Config
    autoload :Model, "active_model/config/model"
  end
end
