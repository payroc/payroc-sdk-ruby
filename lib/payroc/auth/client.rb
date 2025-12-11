# frozen_string_literal: true

module Payroc
  module Auth
    class Client
      # @param client [Payroc::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Obtain an access token using client credentials
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :api_key
      #
      # @return [Payroc::Auth::Types::GetTokenResponse]
      def retrieve_token(request_options: {}, **_params)
        request = Payroc::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
          method: "POST",
          path: "authorize",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Payroc::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Payroc::Auth::Types::GetTokenResponse.load(response.body)
        else
          error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
