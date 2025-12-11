# frozen_string_literal: true

module Payroc
  module Types
    module PricingIntent
      # PricingIntent is an alias for PricingIntent50

      # @option str [String]
      #
      # @return [untyped]
      def self.load(str)
        ::JSON.parse(str)
      end

      # @option value [untyped]
      #
      # @return [String]
      def self.dump(value)
        ::JSON.generate(value)
      end
    end
  end
end
