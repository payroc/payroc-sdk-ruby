# frozen_string_literal: true

module Payroc
  module Tokenization
    module SingleUseTokens
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

        # Use this method to create a single-use token that represents a customer’s payment details.
        #
        # A single-use token expires after 30 minutes and merchants can use them only once.
        #
        # **Note:** To create a reusable permanent token, go to [Create Secure
        # Token](https://docs.payroc.com/api/schema/tokenization/secure-tokens/create).
        #
        # In the request, send the customer’s payment details. If the request is successful, our gateway returns a token
        # that you can use in a follow-on action, for example, [run a
        # sale](https://docs.payroc.com/api/schema/card-payments/payments/create).
        #
        # @param request_options [Hash]
        # @param params [Payroc::Tokenization::SingleUseTokens::Types::SingleUseTokenRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :processing_terminal_id
        # @option params [String] :idempotency_key
        #
        # @return [Payroc::Types::SingleUseToken]
        def create(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          path_param_names = %i[processing_terminal_id]
          body_params = params.except(*path_param_names)
          body_prop_names = %i[channel operator source]
          body_bag = body_params.slice(*body_prop_names)

          headers = {}
          headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "POST",
            path: "processing-terminals/#{params[:processing_terminal_id]}/single-use-tokens",
            headers: headers,
            body: Payroc::Tokenization::SingleUseTokens::Types::SingleUseTokenRequest.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::SingleUseToken.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
