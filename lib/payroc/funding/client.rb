# frozen_string_literal: true

module Payroc
  module Funding
    class Client
      # @param client [Payroc::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # @return [Payroc::FundingRecipients::Client]
      def funding_recipients
        @funding_recipients ||= Payroc::Funding::FundingRecipients::Client.new(client: @client)
      end

      # @return [Payroc::FundingAccounts::Client]
      def funding_accounts
        @funding_accounts ||= Payroc::Funding::FundingAccounts::Client.new(client: @client)
      end

      # @return [Payroc::FundingInstructions::Client]
      def funding_instructions
        @funding_instructions ||= Payroc::Funding::FundingInstructions::Client.new(client: @client)
      end

      # @return [Payroc::FundingActivity::Client]
      def funding_activity
        @funding_activity ||= Payroc::Funding::FundingActivity::Client.new(client: @client)
      end
    end
  end
end
