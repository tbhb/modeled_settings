# frozen_string_literal: true

module ModeledSettings
  module VERSION
    MAJOR = 0
    MINOR = 1
    TINY  = 0
    PRE   = "alpha"

    STRING = [ MAJOR, MINOR, TINY, PRE ].compact.join(".")
  end

  # Returns the currently loaded version of Modeled Settings as a +Gem::Version+.
  def self.gem_version
    Gem::Version.new VERSION::STRING
  end

  # Returns the currently loaded version of Modeled Settings as a string.
  def self.version
    VERSION::STRING
  end
end
