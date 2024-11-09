# frozen_string_literal: true

# Set up gems listed in the Gemfile.
ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../../../Gemfile", __dir__)

require "bundler/setup" if File.exist?(ENV["BUNDLE_GEMFILE"])
$LOAD_PATH.unshift File.expand_path("../../../lib", __dir__)
$LOAD_PATH.unshift File.expand_path("../../dummy_engine/lib", __dir__)
$LOAD_PATH.unshift File.expand_path("../../dummy_railtie/lib", __dir__)