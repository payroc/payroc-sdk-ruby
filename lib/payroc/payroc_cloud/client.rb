# frozen_string_literal: true

module Payroc
  module PayrocCloud
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

      # @return [Payroc::PaymentInstructions::Client]
      def payment_instructions
        @payment_instructions ||= Payroc::PayrocCloud::PaymentInstructions::Client.new(client: @client, base_url: @base_url, environment: @environment)
      end

      # @return [Payroc::RefundInstructions::Client]
      def refund_instructions
        @refund_instructions ||= Payroc::PayrocCloud::RefundInstructions::Client.new(client: @client, base_url: @base_url, environment: @environment)
      end

      # @return [Payroc::SignatureInstructions::Client]
      def signature_instructions
        @signature_instructions ||= Payroc::PayrocCloud::SignatureInstructions::Client.new(client: @client, base_url: @base_url, environment: @environment)
      end

      # @return [Payroc::Signatures::Client]
      def signatures
        @signatures ||= Payroc::PayrocCloud::Signatures::Client.new(client: @client, base_url: @base_url, environment: @environment)
      end
    end
  end
end
