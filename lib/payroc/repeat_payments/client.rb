# frozen_string_literal: true

module Payroc
  module RepeatPayments
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

      # @return [Payroc::PaymentPlans::Client]
      def payment_plans
        @payment_plans ||= Payroc::RepeatPayments::PaymentPlans::Client.new(client: @client, base_url: @base_url, environment: @environment)
      end

      # @return [Payroc::Subscriptions::Client]
      def subscriptions
        @subscriptions ||= Payroc::RepeatPayments::Subscriptions::Client.new(client: @client, base_url: @base_url, environment: @environment)
      end
    end
  end
end
