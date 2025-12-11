# frozen_string_literal: true

module Payroc
  module Boarding
    class Client
      # @param client [Payroc::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # @return [Payroc::Owners::Client]
      def owners
        @owners ||= Payroc::Boarding::Owners::Client.new(client: @client)
      end

      # @return [Payroc::PricingIntents::Client]
      def pricing_intents
        @pricing_intents ||= Payroc::Boarding::PricingIntents::Client.new(client: @client)
      end

      # @return [Payroc::MerchantPlatforms::Client]
      def merchant_platforms
        @merchant_platforms ||= Payroc::Boarding::MerchantPlatforms::Client.new(client: @client)
      end

      # @return [Payroc::ProcessingAccounts::Client]
      def processing_accounts
        @processing_accounts ||= Payroc::Boarding::ProcessingAccounts::Client.new(client: @client)
      end

      # @return [Payroc::ProcessingTerminals::Client]
      def processing_terminals
        @processing_terminals ||= Payroc::Boarding::ProcessingTerminals::Client.new(client: @client)
      end

      # @return [Payroc::Contacts::Client]
      def contacts
        @contacts ||= Payroc::Boarding::Contacts::Client.new(client: @client)
      end

      # @return [Payroc::TerminalOrders::Client]
      def terminal_orders
        @terminal_orders ||= Payroc::Boarding::TerminalOrders::Client.new(client: @client)
      end
    end
  end
end
