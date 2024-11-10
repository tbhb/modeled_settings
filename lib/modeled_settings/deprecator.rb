# frozen_string_literal: true

module ModeledSettings
  def self.deprecator # :nodoc:
    @deprecator ||= ActiveSupport::Deprecation.new
  end
end
