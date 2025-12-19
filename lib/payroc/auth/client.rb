# frozen_string_literal: true

module Payroc
  module Auth
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
      def retrieve_token(request_options: {}, **params)
        params = Payroc::Internal::Types::Utils.normalize_keys(params)
        headers = {}
        headers["x-api-key"] = params[:api_key] if params[:api_key]

        request = Payroc::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || @base_url || @environment&.dig(:identity),
          method: "POST",
          path: "authorize",
          headers: headers,
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
