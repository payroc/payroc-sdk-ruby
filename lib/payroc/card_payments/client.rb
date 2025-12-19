# frozen_string_literal: true

module Payroc
  module CardPayments
    class Client
      # @param client [Payroc::Internal::Http::RawClient]
      # @param base_url [String, nil]
      # @param environment [Hash[Symbol, String], nil]
      #
      # @return [void]
      def initialize(client:, base_url: nil, environment: nil)
        @client = client
        @base_url = base_url
        @environment = environment
      end

      # @return [Payroc::Payments::Client]
      def payments
        @payments ||= Payroc::CardPayments::Payments::Client.new(client: @client, base_url: @base_url, environment: @environment)
      end

      # @return [Payroc::Refunds::Client]
      def refunds
        @refunds ||= Payroc::CardPayments::Refunds::Client.new(client: @client, base_url: @base_url, environment: @environment)
      end
    end
  end
end
