# frozen_string_literal: true

require_relative "sentry_integration"

module Payroc
  class Client
    # @param base_url [String, nil]
    # @param environment [Hash[Symbol, String], nil]
    # @param api_key [String]
    #
    # @return [void]
    def initialize(api_key:, base_url: nil, environment: Payroc::Environment::PRODUCTION)
      # Create an unauthenticated client for the auth endpoint
      auth_raw_client = Payroc::Internal::Http::RawClient.new(
        base_url: base_url || environment&.dig(:identity),
        headers: {
          "X-Fern-Language" => "Ruby",
          "X-Api-Key" => api_key
        }
      )

      # Create the auth client for token retrieval
      auth_client = Payroc::Auth::Client.new(client: auth_raw_client)

      # Create the auth provider with the auth client and credentials
      @auth_provider = Payroc::Internal::InferredAuthProvider.new(
        auth_client: auth_client,
        options: { base_url: base_url, api_key: api_key }
      )

      @base_url = base_url
      @environment = environment

      @raw_client = Payroc::Internal::Http::RawClient.new(
        base_url: base_url || environment&.dig(:api),
        headers: {
          "X-Fern-Language" => "Ruby"
        }.merge(@auth_provider.auth_headers)
      )
    end

    # @return [Payroc::PaymentLinks::Client]
    def payment_links
      @payment_links ||= Payroc::PaymentLinks::Client.new(client: @raw_client, base_url: @base_url, environment: @environment)
    end

    # @return [Payroc::HostedFields::Client]
    def hosted_fields
      @hosted_fields ||= Payroc::HostedFields::Client.new(client: @raw_client, base_url: @base_url, environment: @environment)
    end

    # @return [Payroc::ApplePaySessions::Client]
    def apple_pay_sessions
      @apple_pay_sessions ||= Payroc::ApplePaySessions::Client.new(client: @raw_client, base_url: @base_url, environment: @environment)
    end

    # @return [Payroc::Auth::Client]
    def auth
      @auth ||= Payroc::Auth::Client.new(client: @raw_client, base_url: @base_url, environment: @environment)
    end

    # @return [Payroc::Funding::Client]
    def funding
      @funding ||= Payroc::Funding::Client.new(client: @raw_client, base_url: @base_url, environment: @environment)
    end

    # @return [Payroc::BankTransferPayments::Client]
    def bank_transfer_payments
      @bank_transfer_payments ||= Payroc::BankTransferPayments::Client.new(client: @raw_client, base_url: @base_url, environment: @environment)
    end

    # @return [Payroc::Boarding::Client]
    def boarding
      @boarding ||= Payroc::Boarding::Client.new(client: @raw_client, base_url: @base_url, environment: @environment)
    end

    # @return [Payroc::CardPayments::Client]
    def card_payments
      @card_payments ||= Payroc::CardPayments::Client.new(client: @raw_client, base_url: @base_url, environment: @environment)
    end

    # @return [Payroc::Notifications::Client]
    def notifications
      @notifications ||= Payroc::Notifications::Client.new(client: @raw_client, base_url: @base_url, environment: @environment)
    end

    # @return [Payroc::PaymentFeatures::Client]
    def payment_features
      @payment_features ||= Payroc::PaymentFeatures::Client.new(client: @raw_client, base_url: @base_url, environment: @environment)
    end

    # @return [Payroc::PayrocCloud::Client]
    def payroc_cloud
      @payroc_cloud ||= Payroc::PayrocCloud::Client.new(client: @raw_client, base_url: @base_url, environment: @environment)
    end

    # @return [Payroc::RepeatPayments::Client]
    def repeat_payments
      @repeat_payments ||= Payroc::RepeatPayments::Client.new(client: @raw_client, base_url: @base_url, environment: @environment)
    end

    # @return [Payroc::Reporting::Client]
    def reporting
      @reporting ||= Payroc::Reporting::Client.new(client: @raw_client, base_url: @base_url, environment: @environment)
    end

    # @return [Payroc::Tokenization::Client]
    def tokenization
      @tokenization ||= Payroc::Tokenization::Client.new(client: @raw_client, base_url: @base_url, environment: @environment)
    end
  end
end
