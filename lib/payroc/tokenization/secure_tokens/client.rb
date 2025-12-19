# frozen_string_literal: true

module Payroc
  module Tokenization
    module SecureTokens
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

        # Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of secure tokens.
        #
        # **Note:** If you want to view the details of a specific secure token and you have its secureTokenId, use our
        # [Retrieve Secure Token](https://docs.payroc.com/api/schema/tokenization/secure-tokens/retrieve) method.
        #
        # Use query parameters to filter the list of results that we return, for example, to search for secure tokens by
        # customer or by the first four digits of a card number.
        #
        # Our gateway returns information about the following for each secure token in the list:
        #
        #   -	Payment details that the secure token represents.
        #   -	Customer details, including shipping and billing addresses.
        #   -	Secure token that you can use to carry out transactions.
        #
        #   For each secure token, we also return the secureTokenId, which you can use to perform follow-on actions.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :processing_terminal_id
        # @option params [String, nil] :secure_token_id
        # @option params [String, nil] :customer_name
        # @option params [String, nil] :phone
        # @option params [String, nil] :email
        # @option params [String, nil] :token
        # @option params [String, nil] :first_6
        # @option params [String, nil] :last_4
        # @option params [String, nil] :before
        # @option params [String, nil] :after
        # @option params [Integer, nil] :limit
        #
        # @return [Payroc::Types::SecureTokenPaginatedListWithAccountType]
        def list(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[secure_token_id customer_name phone email token first_6 last_4 before after limit]
          query_params = {}
          query_params["secureTokenId"] = params[:secure_token_id] if params.key?(:secure_token_id)
          query_params["customerName"] = params[:customer_name] if params.key?(:customer_name)
          query_params["phone"] = params[:phone] if params.key?(:phone)
          query_params["email"] = params[:email] if params.key?(:email)
          query_params["token"] = params[:token] if params.key?(:token)
          query_params["first6"] = params[:first_6] if params.key?(:first_6)
          query_params["last4"] = params[:last_4] if params.key?(:last_4)
          query_params["before"] = params[:before] if params.key?(:before)
          query_params["after"] = params[:after] if params.key?(:after)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          params = params.except(*query_param_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "GET",
            path: "processing-terminals/#{params[:processing_terminal_id]}/secure-tokens",
            query: query_params,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            parsed_response = Payroc::Types::SecureTokenPaginatedListWithAccountType.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end

          Payroc::Internal::PayrocPager.new(
            parsed_response,
            item_field: :data,
            raw_client: @client
          )
        end

        # Use this method to create a secure token that represents a customer's payment details.
        #
        # When you create a secure token, you need to generate and provide a secureTokenId that you use to run follow-on
        # actions:
        # - [Retrieve Secure Token](https://docs.payroc.com/api/schema/tokenization/secure-tokens/retrieve) – View the
        # details of the secure token.
        # - [Delete Secure Token](https://docs.payroc.com/api/schema/tokenization/secure-tokens/delete) – Delete the
        # secure token.
        # - [Update Secure Token](https://docs.payroc.com/api/schema/tokenization/secure-tokens/partially-update) –
        # Update the details of the secure token.
        # - [Update Account Details](https://docs.payroc.com/api/schema/tokenization/secure-tokens/update-account) –
        # Update the secure token with the details from a single-use token.
        #
        # **Note:** If you don't generate a secureTokenId to identify the token, our gateway generates a unique
        # identifier and returns it in the response.
        #
        # If the request is successful, our gateway returns a token that the merchant can use in transactions instead of
        # the customer's sensitive payment details, for example, when they [run a
        # sale](https://docs.payroc.com/api/schema/card-payments/payments/create).
        #
        # @param request_options [Hash]
        # @param params [Payroc::Tokenization::SecureTokens::Types::TokenizationRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :processing_terminal_id
        # @option params [String] :idempotency_key
        #
        # @return [Payroc::Types::SecureToken]
        def create(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          path_param_names = %i[processing_terminal_id]
          body_params = params.except(*path_param_names)
          body_prop_names = %i[secure_token_id operator mit_agreement customer ip_address source three_d_secure custom_fields]
          body_bag = body_params.slice(*body_prop_names)

          headers = {}
          headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "POST",
            path: "processing-terminals/#{params[:processing_terminal_id]}/secure-tokens",
            headers: headers,
            body: Payroc::Tokenization::SecureTokens::Types::TokenizationRequest.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::SecureToken.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to retrieve information about a secure token.
        #
        # To retrieve a secure token, you need its secureTokenID, which you sent in the request of the [Create Secure
        # Token](https://docs.payroc.com/api/schema/tokenization/secure-tokens/create) method.
        #
        # **Note:** If you don't have the secureTokenId, use our [List Secure
        # Tokens](https://docs.payroc.com/api/schema/tokenization/secure-tokens/list) method to search for the secure
        # token.
        #
        # Our gateway returns the following information about the secure token:
        #
        #   -	Payment details that the secure token represents.
        #   -	Customer details, including shipping and billing addresses.
        #   -	Secure token that you can use to carry out transactions.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :processing_terminal_id
        # @option params [String] :secure_token_id
        #
        # @return [Payroc::Types::SecureTokenWithAccountType]
        def retrieve(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "GET",
            path: "processing-terminals/#{params[:processing_terminal_id]}/secure-tokens/#{params[:secure_token_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::SecureTokenWithAccountType.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to delete a secure token and its related payment details from our vault.
        #
        # To delete a secure token, you need its secureTokenId, which you sent in the request of the [Create Secure
        # Token](https://docs.payroc.com/api/schema/tokenization/secure-tokens/create) method.
        #
        # **Note:** If you don’t have the secureTokenId, use our [List Secure
        # Tokens](https://docs.payroc.com/api/schema/tokenization/secure-tokens/list) method to search for the secure
        # token.
        #
        # When you delete a secure token, you can’t recover it, and you can’t reuse its identifier for a new token.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :processing_terminal_id
        # @option params [String] :secure_token_id
        #
        # @return [untyped]
        def delete(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "DELETE",
            path: "processing-terminals/#{params[:processing_terminal_id]}/secure-tokens/#{params[:secure_token_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          return if code.between?(200, 299)

          error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end

        # Use this method to partially update a secure token. Structure your request to follow the [RFC
        # 6902](https://datatracker.ietf.org/doc/html/rfc6902) standard.
        #
        # To update a secure token, you need its secureTokenId, which you sent in the request of the [Create Secure
        # Token](https://docs.payroc.com/api/schema/tokenization/secure-tokens/create) method.
        #
        # **Note:** If you don't have the secureTokenId, use our [List Secure
        # Tokens](https://docs.payroc.com/api/schema/tokenization/secure-tokens/list) method to search  for the payment.
        #
        # You can update all of the properties of the secure token, except the following:
        # - processingTerminalId
        # - type
        # - token
        # - status
        # - source/Card
        #   - type
        #   - cardNumber
        #   - cardType
        #   - currency
        #   - debit
        #   - surcharging
        # - source/ACH account
        #   - accountNumber
        #   - routingNumber
        # - source/PAD account
        #   - type
        #   - accountNumber
        #   - transitNumber
        #
        # @param request_options [Hash]
        # @param params [Payroc::Types::PatchRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :processing_terminal_id
        # @option params [String] :secure_token_id
        # @option params [String] :idempotency_key
        #
        # @return [Payroc::Types::SecureToken]
        def partially_update(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          path_param_names = %i[processing_terminal_id secure_token_id]
          body_params = params.except(*path_param_names)

          headers = {}
          headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "PATCH",
            path: "processing-terminals/#{params[:processing_terminal_id]}/secure-tokens/#{params[:secure_token_id]}",
            headers: headers,
            body: body_params,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::SecureToken.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to update a secure token if you have a single-use token from Hosted Fields.
        #
        # **Note:** If you don't have a single-use token, you can update saved payment details with our [Update Secure
        # Token](https://docs.payroc.com/api/resources#updateSecureToken) method. For more information about our two
        # options to update a secure token, go to [Update saved payment
        # details](https://docs.payroc.com/guides/integrate/update-saved-payment-details).
        #
        # @param request_options [Hash]
        # @param params [Payroc::Types::AccountUpdate]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :processing_terminal_id
        # @option params [String] :secure_token_id
        # @option params [String] :idempotency_key
        #
        # @return [Payroc::Types::SecureToken]
        def update_account(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          path_param_names = %i[processing_terminal_id secure_token_id]
          body_params = params.except(*path_param_names)

          headers = {}
          headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "POST",
            path: "processing-terminals/#{params[:processing_terminal_id]}/secure-tokens/#{params[:secure_token_id]}/update-account",
            headers: headers,
            body: Payroc::Types::AccountUpdate.new(body_params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::SecureToken.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
