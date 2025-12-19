# frozen_string_literal: true

module Payroc
  module Boarding
    module MerchantPlatforms
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

        # Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of merchant platforms
        # that are linked to your ISV account.
        #
        # **Note**: If you want to view the details of a specific merchant platform and you have its merchantPlatformId,
        # use our [Retrieve Merchant Platform](https://docs.payroc.com/api/schema/boarding/merchant-platforms/retrieve)
        # method.
        #
        # Our gateway returns the following information about each merchant platform in the list:
        # - Legal information, including its legal name and address.
        # - Contact information, including the email address for the business.
        # - Processing  account information, including the processingAccountId and status of each processing account
        # that's linked to the merchant platform.
        #
        # For each merchant platform, we also return its merchantPlatformId and its linked processingAccountIds, which
        # you can use to perform follow-on actions.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String, nil] :before
        # @option params [String, nil] :after
        # @option params [Integer, nil] :limit
        #
        # @return [Payroc::Types::PaginatedMerchants]
        def list(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[before after limit]
          query_params = {}
          query_params["before"] = params[:before] if params.key?(:before)
          query_params["after"] = params[:after] if params.key?(:after)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          params.except(*query_param_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "GET",
            path: "merchant-platforms",
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
            parsed_response = Payroc::Types::PaginatedMerchants.load(response.body)
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

        # Use this method to board a merchant with Payroc.
        #
        # **Note**: This method is part of our Boarding solution. To help you understand how this method works with
        # other Boarding methods, go to [Board a Merchant](https://docs.payroc.com/guides/integrate/boarding).
        #
        # In the request, include the following information:
        # - Legal information, including its legal name and address.
        # - Contact information, including the email address for the business.
        # - Processing account information, including the pricing model, owners, and contacts for the processing
        # account.
        #
        # When you send a successful request, we review the merchant's information. After we complete our review and
        # approve the merchant, we assign:
        # - **merchantPlatformId** - Unique identifier for the merchant platform.
        # - **processingAccountId** - Unique identifier for each processing account linked to the merchant platform.
        #
        # You need to keep these to perform follow-on actions, for example, you need the processingAccountId to [order
        # terminals](https://docs.payroc.com/api/schema/boarding/processing-accounts/create-terminal-order) for the
        # processing account.
        #
        # @param request_options [Hash]
        # @param params [Payroc::Boarding::MerchantPlatforms::Types::CreateMerchantAccount]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :idempotency_key
        #
        # @return [Payroc::Types::MerchantPlatform]
        def create(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          body_prop_names = %i[business processing_accounts metadata]
          body_bag = params.slice(*body_prop_names)

          headers = {}
          headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "POST",
            path: "merchant-platforms",
            headers: headers,
            body: Payroc::Boarding::MerchantPlatforms::Types::CreateMerchantAccount.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::MerchantPlatform.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to retrieve information about a merchant platform.
        #
        # To retrieve a merchant platform, you need its merchantPlatformId. Our gateway returned the merchantPlatformId
        # in the response of the [Create Merchant
        # Platform](https://docs.payroc.com/api/schema/boarding/merchant-platforms/create) method.
        #
        # **Note:** If you don't have the merchantPlatformId, use our [List Merchant
        # Platforms](https://docs.payroc.com/api/schema/boarding/merchant-platforms/list) method to search for the
        # merchant platform.
        #
        # Our gateway returns the following information about the merchant platform:
        # -	Legal information, including its legal name and address.
        # -	Contact information, including the email address for the business.
        # -	Processing account information, including the processingAccountId and status of each processing account
        # that's linked to the merchant platform.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :merchant_platform_id
        #
        # @return [Payroc::Types::MerchantPlatform]
        def retrieve(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "GET",
            path: "merchant-platforms/#{params[:merchant_platform_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::MerchantPlatform.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of processing accounts
        # linked to a merchant platform.
        #
        # **Note**: If you want to view the details of a specific processing account and you have its
        # processingAccountId, use our [Retrieve Processing
        # Account](https://docs.payroc.com/api/schema/boarding/processing-accounts/retrieve) method.
        #
        # Use the query parameters to filter the list of results that we return, for example, to search for only closed
        # processing accounts.
        #
        # To list the processing accounts for a merchant platform, you need its merchantPlatformId. If you don't have
        # the merchantPlatformId, use our [List Merchant
        # Platforms](https://docs.payroc.com/api/schema/boarding/merchant-platforms/list) method to search for the
        # merchant platform.
        #
        # Our gateway returns the following information about eahc processing account in the list:
        # - Business details, including its status, time zone, and address.
        # - Owners' details, including their contact details.
        # - Funding, pricing, and processing information, including its pricing model and funding accounts.
        #
        # For each processing account, we also return its processingAccountId, which you can use to perform follow-on
        # actions.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :merchant_platform_id
        # @option params [String, nil] :before
        # @option params [String, nil] :after
        # @option params [Integer, nil] :limit
        # @option params [Boolean, nil] :include_closed
        #
        # @return [Payroc::Types::PaginatedProcessingAccounts]
        def list_processing_accounts(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[before after limit include_closed]
          query_params = {}
          query_params["before"] = params[:before] if params.key?(:before)
          query_params["after"] = params[:after] if params.key?(:after)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["includeClosed"] = params[:include_closed] if params.key?(:include_closed)
          params = params.except(*query_param_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "GET",
            path: "merchant-platforms/#{params[:merchant_platform_id]}/processing-accounts",
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
            parsed_response = Payroc::Types::PaginatedProcessingAccounts.load(response.body)
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

        # Use this method to add an additional processing account to a merchant platform.
        #
        # To add a processing account to a merchant platform, you need the merchantPlatformId. Our gateway returned the
        # merchantPlatformId in the response of the [Create Merchant
        # Platform](https://docs.payroc.com/api/schema/boarding/merchant-platforms/create) method.
        #
        # **Note**: If you don't have the merchantPlatformId, use our [List Merchant
        # Platforms](https://docs.payroc.com/api/schema/boarding/merchant-platforms/list) method to search for the
        # merchant platform.
        #
        # In the request, include the following information:
        # - Business details, including its business type, time zone, and address.
        # - Owners' details, including their contact details.
        # - Funding, pricing, and processing information, including its pricing model and funding accounts.
        #
        # When you send a successful request, we review the information about the processing account. After we complete
        # our review and approve the processing account, we assign a processingAccountId, which you need to perform
        # follow-on actions.
        #
        # **Note**: You can subscribe to our processingAccount.status.changed event to get notifications when we update
        # the status of a processing account. For more information about how to subscribe to events, go to [Events
        # List](https://docs.payroc.com/knowledge/events/events-list).
        #
        # @param request_options [Hash]
        # @param params [Payroc::Types::CreateProcessingAccount]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :merchant_platform_id
        # @option params [String] :idempotency_key
        #
        # @return [Payroc::Types::ProcessingAccount]
        def create_processing_account(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          path_param_names = %i[merchant_platform_id]
          body_params = params.except(*path_param_names)

          headers = {}
          headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "POST",
            path: "merchant-platforms/#{params[:merchant_platform_id]}/processing-accounts",
            headers: headers,
            body: Payroc::Types::CreateProcessingAccount.new(body_params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::ProcessingAccount.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
