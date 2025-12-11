# frozen_string_literal: true

module Payroc
  module PayrocCloud
    class Client
      # @param client [Payroc::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # @return [Payroc::PaymentInstructions::Client]
      def payment_instructions
        @payment_instructions ||= Payroc::PayrocCloud::PaymentInstructions::Client.new(client: @client)
      end

      # @return [Payroc::RefundInstructions::Client]
      def refund_instructions
        @refund_instructions ||= Payroc::PayrocCloud::RefundInstructions::Client.new(client: @client)
      end

      # @return [Payroc::SignatureInstructions::Client]
      def signature_instructions
        @signature_instructions ||= Payroc::PayrocCloud::SignatureInstructions::Client.new(client: @client)
      end
    end
  end
end
