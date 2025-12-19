# frozen_string_literal: true

module Payroc
  module Funding
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

      # @return [Payroc::FundingRecipients::Client]
      def funding_recipients
        @funding_recipients ||= Payroc::Funding::FundingRecipients::Client.new(client: @client, base_url: @base_url, environment: @environment)
      end

      # @return [Payroc::FundingAccounts::Client]
      def funding_accounts
        @funding_accounts ||= Payroc::Funding::FundingAccounts::Client.new(client: @client, base_url: @base_url, environment: @environment)
      end

      # @return [Payroc::FundingInstructions::Client]
      def funding_instructions
        @funding_instructions ||= Payroc::Funding::FundingInstructions::Client.new(client: @client, base_url: @base_url, environment: @environment)
      end

      # @return [Payroc::FundingActivity::Client]
      def funding_activity
        @funding_activity ||= Payroc::Funding::FundingActivity::Client.new(client: @client, base_url: @base_url, environment: @environment)
      end
    end
  end
end
