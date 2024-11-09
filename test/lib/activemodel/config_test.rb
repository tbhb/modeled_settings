# frozen_string_literal: true

require "test_helper"

class ActiveModel::TestConfig < ActiveModel::Config::TestCase
  test "version" do
    assert_not_nil ::ActiveModel::Config::VERSION
  end
end
