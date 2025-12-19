# frozen_string_literal: true

module Payroc
  module PaymentFeatures
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

      # @return [Payroc::Cards::Client]
      def cards
        @cards ||= Payroc::PaymentFeatures::Cards::Client.new(client: @client, base_url: @base_url, environment: @environment)
      end

      # @return [Payroc::Bank::Client]
      def bank
        @bank ||= Payroc::PaymentFeatures::Bank::Client.new(client: @client, base_url: @base_url, environment: @environment)
      end
    end
  end
end
