# frozen_string_literal: true

# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require_relative "../test/dummy_application/config/environment"
ActiveRecord::Migrator.migrations_paths = [ File.expand_path("../test/dummy_application/db/migrate", __dir__) ]
require "rails/test_help"
require "debug"

require "active_support/testing/method_call_assertions"

# Load fixtures from the engine
if ActiveSupport::TestCase.respond_to?(:fixture_paths=)
  ActiveSupport::TestCase.fixture_paths = [ File.expand_path("fixtures", __dir__) ]
  ActionDispatch::IntegrationTest.fixture_paths = ActiveSupport::TestCase.fixture_paths
  ActiveSupport::TestCase.file_fixture_path = File.expand_path("fixtures", __dir__) + "/files"
  ActiveSupport::TestCase.fixtures :all
end

class ActiveModel::Config::TestCase < ActiveSupport::TestCase
  include ActiveSupport::Testing::MethodCallAssertions
end
