# frozen_string_literal: true

module Payroc
  module Boarding
    module PricingIntents
      class Client
        # @param client [Payroc::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of pricing intents
        # associated with the ISV.
        #
        # **Note:** If you want to view the details of a specific pricing intent and you have its pricingIntentId, use
        # our [Retrieve Pricing Intent](https://docs.payroc.com/api/schema/boarding/pricing-intents/retrieve) method.
        #
        # Our gateway returns the following information about each pricing intent in the list:
        #
        # - Information about the fees, including the base fees, gateway fees, and processor fees.
        # - Status of the pricing intent, including whether we approved the pricing intent.
        #
        # For each pricing intent, we also return its pricingIntentId which you can use to perform follow-on actions.
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
        # @return [Payroc::Types::PaginatedPricingIntent]
        def list(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.symbolize_keys(params)
          query_param_names = %i[before after limit]
          query_params = {}
          query_params["before"] = params[:before] if params.key?(:before)
          query_params["after"] = params[:after] if params.key?(:after)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          params.except(*query_param_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "GET",
            path: "pricing-intents",
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
            parsed_response = Payroc::Types::PaginatedPricingIntent.load(response.body)
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

        # Use this method to create a pricing intent that you can assign to a processing account.
        #
        # In the request, you must provide the following:
        # -	Processing fees, including the pricing program and the fee to process each transaction.
        # -	Gateway fees, including the fee for each transaction handled by our gateway.
        # -	Base fees, including maintenance and PCI fees.
        #
        # In the response, our gateway returns information about the pricing intent and the pricingIntentId, which you
        # need for the following methods:
        # -	[Create Merchant Platform](https://docs.payroc.com/api/schema/boarding/merchant-platforms/create) - Assign
        # the pricing intent to a processing account, when you create the merchant platform and its processing accounts.
        # -	[Create Processing
        # Account](https://docs.payroc.com/api/schema/boarding/merchant-platforms/create-processing-account) - Assign
        # the pricing intent to a processing account.
        # -	[Retrieve Pricing Intent](https://docs.payroc.com/api/schema/boarding/pricing-intents/retrieve) - Retrieve
        # information about a pricing intent.
        # -	[Update Pricing Intent](https://docs.payroc.com/api/schema/boarding/pricing-intents/update) - Update the
        # details of a pricing intent.
        # -	[Delete Pricing Intent](https://docs.payroc.com/api/schema/boarding/pricing-intents/delete) - Delete a
        # pricing intent.
        # -	[Partially Update Pricing
        # Intent](https://docs.payroc.com/api/schema/boarding/pricing-intents/partially-update) - Partially update the
        # details of a pricing intent.
        #
        # @param request_options [Hash]
        # @param params [Payroc::Types::PricingIntent]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :idempotency_key
        #
        # @return [Payroc::Types::PricingIntent50]
        def create(request_options: {}, **params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "POST",
            path: "pricing-intents",
            body: params,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::PricingIntent.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to retrieve information about a pricing intent.
        #
        # To retrieve a pricing intent, you need its pricingIntentId. Our gateway returned the pricingIntentId in the
        # response of the [Create Pricing Intent](https://docs.payroc.com/api/schema/boarding/pricing-intents/create)
        # method.
        #
        # **Note:** If you don't have the pricingIntentId, use our [List Pricing
        # Intents](https://docs.payroc.com/api/schema/boarding/pricing-intents/list) method to search for the pricing
        # intent.
        #
        # Our gateway returns the following information about the pricing intent:
        #
        # - Information about the fees, including the base fees, gateway fees, and processor fees.
        # - Status of the pricing intent, including whether we approved the pricing intent.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :pricing_intent_id
        #
        # @return [Payroc::Types::PricingIntent50]
        def retrieve(request_options: {}, **params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "GET",
            path: "pricing-intents/#{params[:pricing_intent_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::PricingIntent.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to update the details of a pricing intent. If you update a pricing intent, it won't affect
        # merchant that you've previously onboarded.
        #
        # To update a pricing intent, you need its pricingIntentId. Our gateway returned the pricingIntentId in the
        # response of the [Create Pricing Intent](https://docs.payroc.com/api/schema/boarding/pricing-intents/create)
        # method.
        #
        # **Note:** If you don't have the pricingIntentId, use our [List Pricing
        # Intents](https://docs.payroc.com/api/schema/boarding/pricing-intents/list) method to search for the pricing
        # intent.
        #
        # You can update the following details about a pricing intent:
        #
        # - Fees, including the base fees, processor fees, and gateway fees.
        # - Custom name for the pricing intent.
        # - Additional services that merchants can sign up for.
        #
        # @param request_options [Hash]
        # @param params [Payroc::Types::PricingIntent]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :pricing_intent_id
        #
        # @return [untyped]
        def update(request_options: {}, **params)
          path_param_names = %i[pricing_intent_id]
          body_params = params.except(*path_param_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "PUT",
            path: "pricing-intents/#{params[:pricing_intent_id]}",
            body: body_params,
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

        # Use this method to delete a pricing intent.
        #
        # > **Important:** When you delete a pricing intent, you can't recover it. You also won't be able to assign the
        # pricing intent to a merchant's boarding application.
        #
        # To delete a pricing intent, you need its pricingIntentId. Our gateway returned the pricingIntentId in the
        # response of the [Create Pricing Intent](https://docs.payroc.com/api/schema/boarding/pricing-intents/create)
        # method.
        #
        # **Note:** If you don't have the pricingIntentId, use our [List Pricing
        # Intents](https://docs.payroc.com/api/schema/boarding/pricing-intents/list) method to search for the pricing
        # intent.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :pricing_intent_id
        #
        # @return [untyped]
        def delete(request_options: {}, **params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "DELETE",
            path: "pricing-intents/#{params[:pricing_intent_id]}",
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

        # Use this method to partially update a pricing intent. Structure your request to follow the [RFC
        # 6902](https://datatracker.ietf.org/doc/html/rfc6902) standard.
        #
        # If you update a pricing intent, it won't affect merchants you've previously onboarded.
        #
        # To update a pricing intent, you need its pricingIntentId. Our gateway returned the pricingIntentId in the
        # response of the [Create Pricing Intent](https://docs.payroc.com/api/schema/boarding/pricing-intents/create)
        # method.
        #
        # **Note:** If you don't have the pricingIntentId, use our [List Pricing
        # Intents](https://docs.payroc.com/api/schema/boarding/pricing-intents/list) method to search for the pricing
        # intent.
        #
        # You can update the following details about a pricing intent:
        #
        # - Fees, including the base fees, processor fees, and gateway fees.
        # - Custom name for the pricing intent.
        # - Additional services that merchants can sign up for.
        #
        # @param request_options [Hash]
        # @param params [Payroc::Types::PatchRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :pricing_intent_id
        # @option params [String] :idempotency_key
        #
        # @return [Payroc::Types::PricingIntent50]
        def partially_update(request_options: {}, **params)
          path_param_names = %i[pricing_intent_id]
          body_params = params.except(*path_param_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "PATCH",
            path: "pricing-intents/#{params[:pricing_intent_id]}",
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
            Payroc::Types::PricingIntent.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
