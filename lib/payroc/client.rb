# frozen_string_literal: true

require_relative "sentry_integration"

module Payroc
  class Client
    # @param base_url [String, nil]
    # @param api_key [String]
    #
    # @return [void]
    def initialize(base_url:, api_key:)
      # Create an unauthenticated client for the auth endpoint
      auth_raw_client = Payroc::Internal::Http::RawClient.new(
        base_url: base_url,
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

      @raw_client = Payroc::Internal::Http::RawClient.new(
        base_url: base_url,
        headers: {
          "X-Fern-Language" => "Ruby"
        }.merge(@auth_provider.auth_headers)
      )
    end

    # @return [Payroc::Payments::Client]
    def payments
      @payments ||= Payroc::Payments::Client.new(client: @raw_client)
    end

    # @return [Payroc::Auth::Client]
    def auth
      @auth ||= Payroc::Auth::Client.new(client: @raw_client)
    end

    # @return [Payroc::Funding::Client]
    def funding
      @funding ||= Payroc::Funding::Client.new(client: @raw_client)
    end

    # @return [Payroc::Boarding::Client]
    def boarding
      @boarding ||= Payroc::Boarding::Client.new(client: @raw_client)
    end

    # @return [Payroc::Notifications::Client]
    def notifications
      @notifications ||= Payroc::Notifications::Client.new(client: @raw_client)
    end

    # @return [Payroc::PayrocCloud::Client]
    def payroc_cloud
      @payroc_cloud ||= Payroc::PayrocCloud::Client.new(client: @raw_client)
    end

    # @return [Payroc::Reporting::Client]
    def reporting
      @reporting ||= Payroc::Reporting::Client.new(client: @raw_client)
    end
  end
end
