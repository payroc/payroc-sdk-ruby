# frozen_string_literal: true

module Payroc
  module ApplePaySessions
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

      # Use this method to start an Apple Pay session for your merchant.
      #
      # In the response, we return the startSessionObject that you send to Apple when you retrieve the cardholder's
      # encrypted payment details.
      #
      # **Note:** For more information about how to integrate with Apple Pay, go to [Apple
      # Pay](https://docs.payroc.com/guides/integrate/apple-pay).
      #
      # @param request_options [Hash]
      # @param params [Payroc::ApplePaySessions::Types::ApplePaySessions]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :processing_terminal_id
      #
      # @return [Payroc::Types::ApplePayResponseSession]
      def create(request_options: {}, **params)
        params = Payroc::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[processing_terminal_id]
        body_params = params.except(*path_param_names)
        body_prop_names = %i[apple_domain_id apple_validation_url]
        body_bag = body_params.slice(*body_prop_names)

        request = Payroc::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
          method: "POST",
          path: "processing-terminals/#{params[:processing_terminal_id]}/apple-pay-sessions",
          body: Payroc::ApplePaySessions::Types::ApplePaySessions.new(body_bag).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Payroc::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Payroc::Types::ApplePayResponseSession.load(response.body)
        else
          error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
