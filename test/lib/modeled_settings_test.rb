# frozen_string_literal: true

require "test_helper"

class ModeledSettingsTest < ModeledSettings::TestCase
  test "version" do
    assert_not_nil ::ModeledSettings::VERSION::STRING
  end
end
