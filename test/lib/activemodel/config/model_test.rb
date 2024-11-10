# frozen_string_literal: true

require "test_helper"

module ActiveModel
  module Config
    class ModelTest < ActiveModel::Config::TestCase
      test "setting defines an attribute" do
        config_class.setting :foo, :string

        assert_includes config_class.attribute_names, "foo"
      end

      test "setting with required option adds presence validation" do
        config_class.setting :foo, :string, required: true

        validator = config_class.validators_on(:foo).first

        assert_instance_of ActiveModel::Validations::PresenceValidator, validator
      end

      test "setting with nested settings" do
        config_class.setting :foo do
          setting :bar
        end

        config = config_class.new
        config.foo.bar = "baz"

        assert_equal "baz", config.foo.bar
        assert_predicate config, :valid?
      end

      test "initializes nested settings" do
        config_class.setting :foo do
          setting :bar, :string, default: "baz"
        end

        config = config_class.new(foo: { bar: "qux" })

        assert_equal "qux", config.foo.bar
        assert_predicate config, :valid?
      end

      test "validates nested settings" do
        config_class.setting :foo do
          setting :bar, :string, required: true
        end

        config = config_class.new
        config.foo.bar = nil

        assert_not config.valid?
      end

      test "setting with deeply nested settings" do
        config_class.setting :foo do
          setting :bar do
            setting :baz
          end
        end

        config = config_class.new
        config.foo.bar.baz = "qux"

        assert_equal "qux", config.foo.bar.baz
        assert_predicate config, :valid?
      end

      test "initializes deeply nested settings" do
        config_class.setting :foo do
          setting :bar do
            setting :baz, :string, default: "qux"
          end
        end

        config = config_class.new(foo: { bar: { baz: "quux" } })

        assert_equal "quux", config.foo.bar.baz
        assert_predicate config, :valid?
      end

      test "validates deeply nested settings" do
        config_class.setting :foo do
          setting :bar do
            setting :baz, :string, required: true
          end
        end

        config = config_class.new
        config.foo.bar.baz = nil

        assert_not config.valid?
      end

      private
        def config_class
          @config_class ||= Class.new do
            include ActiveModel::Config::Model
          end
        end
    end
  end
end
