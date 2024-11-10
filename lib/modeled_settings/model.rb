# frozen_string_literal: true

require "active_model"
require "active_model/attributes"
require "active_model/model"

module ModeledSettings::Model
  extend ActiveSupport::Concern

  include ActiveModel::Model
  include ActiveModel::Attributes

  module ClassMethods
    def setting(name, cast_type = nil, **options, &blk)
      if block_given?
        _setting_block(name, **options, &blk)
      else
        _setting_attribute(name, cast_type, **options)
      end
    end

    private
      def _setting_attribute(name, cast_type = nil, **options)
        default = options.delete(:default)
        attribute(name, cast_type, default:)

        validations = {}
        validations[:presence] = true if options.delete(:required)

        validates(name, **validations) unless validations.empty?
        true
      end

      def _setting_block(name, **options, &blk)
        scope = Class.new do
          include ModeledSettings::Model
        end

        scope.class_eval(&blk)

        module_eval <<-RUBY, __FILE__, __LINE__ + 1
          def #{name}=(settings)
            if settings.is_a?(Hash)
              #{name}.assign_attributes(settings)
            else
              super
            end
          end
        RUBY

        attribute(name, default: scope.new, **options)

        validates_each(name) do |record, attr, value|
          record.errors.add(attr, :invalid) unless value.valid?
        end
      end
  end
end
