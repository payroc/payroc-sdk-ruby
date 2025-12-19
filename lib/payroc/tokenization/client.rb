# frozen_string_literal: true

module Payroc
  module Tokenization
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

      # @return [Payroc::SecureTokens::Client]
      def secure_tokens
        @secure_tokens ||= Payroc::Tokenization::SecureTokens::Client.new(client: @client, base_url: @base_url, environment: @environment)
      end

      # @return [Payroc::SingleUseTokens::Client]
      def single_use_tokens
        @single_use_tokens ||= Payroc::Tokenization::SingleUseTokens::Client.new(client: @client, base_url: @base_url, environment: @environment)
      end
    end
  end
end
