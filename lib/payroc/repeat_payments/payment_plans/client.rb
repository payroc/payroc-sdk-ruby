# frozen_string_literal: true

module Payroc
  module RepeatPayments
    module PaymentPlans
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

        # Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of payment plans for a
        # processing terminal.
        #
        # **Note:** If you want to view the details of a specific payment plan and you have its paymentPlanId, use our
        # [Retrieve Payment Plan](https://docs.payroc.com/api/schema/repeat-payments/payment-plans/retrieve) method.
        #
        # Our gateway returns the following information about each payment plan in the list:
        #
        #   -	Name, length, and currency of the plan
        #   -	How often our gateway collects each payment
        #   -	How much our gateway collects for each payment
        #   -	What happens if the merchant updates or deletes the plan
        #
        # For each payment plan, we return the paymentPlanId, which you can use to perform follow-on actions.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :processing_terminal_id
        # @option params [String, nil] :before
        # @option params [String, nil] :after
        # @option params [Integer, nil] :limit
        #
        # @return [Payroc::Types::PaymentPlanPaginatedList]
        def list(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[before after limit]
          query_params = {}
          query_params["before"] = params[:before] if params.key?(:before)
          query_params["after"] = params[:after] if params.key?(:after)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          params = params.except(*query_param_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "GET",
            path: "processing-terminals/#{params[:processing_terminal_id]}/payment-plans",
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
            parsed_response = Payroc::Types::PaymentPlanPaginatedList.load(response.body)
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

        # Use this method to create a payment schedule that you can assign customers to.
        #
        # **Note:** This method is part of our Repeat Payments feature. To help you understand how this method works
        # with our Subscriptions endpoints, go to [Repeat
        # Payments](https://docs.payroc.com/guides/take-payments/repeat-payments).
        #
        # When you create a payment plan you need to provide a unique paymentPlanId that you use to run follow-on
        # actions:
        #
        # -	[Retrieve Payment Plan](https://docs.payroc.com/api/schema/repeat-payments/payment-plans/retrieve)  - View
        # the details of the payment plan.
        # -	[Update Payment Plan](https://docs.payroc.com/api/schema/repeat-payments/payment-plans/partially-update)  -
        # Update the details of the payment plan.
        # -	[Delete Payment Plan](https://docs.payroc.com/api/schema/repeat-payments/payment-plans/delete)  - Delete the
        # payment plan.
        # -	[Create Subscription](https://docs.payroc.com/api/schema/repeat-payments/subscriptions/create)  - Subscribe
        # a customer to the payment plan.
        #
        # The request includes the following settings:
        #
        # -	**type** - Indicates if our gateway or the merchant collects payments. If the merchant manually collects
        # payments, integrate with the [Pay Manual
        # Subscription](https://docs.payroc.com/api/schema/repeat-payments/subscriptions/pay) method.
        # -	**recurringOrder** - Amount of each payment if the gateway automatically collect payments.
        # -	**setupOrder** - Setup fee that our gateway immediately collects from the customer's payment method.
        # -	**onUpdate and onDelete** - Indicates what happens to associated subscriptions if the merchant updates or
        # deletes the payment plan.
        #
        # @param request_options [Hash]
        # @param params [Payroc::Types::PaymentPlan]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :processing_terminal_id
        # @option params [String] :idempotency_key
        #
        # @return [Payroc::Types::PaymentPlan]
        def create(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          path_param_names = %i[processing_terminal_id]
          body_params = params.except(*path_param_names)

          headers = {}
          headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "POST",
            path: "processing-terminals/#{params[:processing_terminal_id]}/payment-plans",
            headers: headers,
            body: Payroc::Types::PaymentPlan.new(body_params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::PaymentPlan.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to retrieve information about a payment plan.
        #
        # To retrieve a payment plan, you need its paymentPlanId. Our gateway returned the paymentPlanId in the response
        # of the [Create Payment Plan](https://docs.payroc.com/api/schema/repeat-payments/payment-plans/create) method.
        #
        # **Note:** If you don't have the paymentPlanId, use our [List Payment
        # Plans](https://docs.payroc.com/api/schema/repeat-payments/payment-plans/list) method to search for the payment
        # plan.
        #
        # Our gateway returns the following information about the payment plan:
        #
        #   -	Name, length, and currency of the plan
        #   -	How often our gateway collects each payment
        #   -	How much our gateway collects for each payment
        #   -	What happens if the merchant updates or deletes the plan
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :processing_terminal_id
        # @option params [String] :payment_plan_id
        #
        # @return [Payroc::Types::PaymentPlan]
        def retrieve(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "GET",
            path: "processing-terminals/#{params[:processing_terminal_id]}/payment-plans/#{params[:payment_plan_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::PaymentPlan.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to delete a payment plan.
        #
        # > **Important:** When you delete a payment plan, you can’t recover it. You also won’t be able to add
        # subscriptions to the payment plan.
        #
        # To delete a payment plan, you need its paymentPlanId, which you sent in the request of the [Create Payment
        # Plan](https://docs.payroc.com/api/schema/repeat-payments/payment-plans/create) method.
        #
        # **Note:** If you don't have the paymentPlanId, use our [List Payment
        # Plans](https://docs.payroc.com/api/schema/repeat-payments/payment-plans/list) method to search for the payment
        # plan.
        #
        # The value you sent for the onDelete parameter when you created the payment plan indicates what happens to
        # associated subscriptions when you delete the plan:
        #
        #   -	`complete` - Our gateway stops taking payments for the subscriptions associated with the payment plan.
        # -	`continue` - Our gateway continues to take payments for the subscriptions associated with the payment plan.
        # To stop a subscription for a cancelled payment plan, go to the [Deactivate
        # Subscription](https://docs.payroc.com/api/schema/repeat-payments/subscriptions/deactivate) method.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :processing_terminal_id
        # @option params [String] :payment_plan_id
        #
        # @return [untyped]
        def delete(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "DELETE",
            path: "processing-terminals/#{params[:processing_terminal_id]}/payment-plans/#{params[:payment_plan_id]}",
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

        # Use this method to partially update a payment plan. Structure your request to follow the [RFC
        # 6902](https://datatracker.ietf.org/doc/html/rfc6902) standard.
        #
        # To update a payment plan, you need its paymentPlanId, which you sent in the request of the [Create Payment
        # Plan](https://docs.payroc.com/api/schema/repeat-payments/payment-plans/create) method.
        #
        # **Note:** If you don't have the paymentPlanId, use our [List Payment
        # Plans](https://docs.payroc.com/api/schema/repeat-payments/payment-plans/list) method to search for the payment
        # plan.
        #
        # You can update all of the properties of the payment plan except for the paymentPlanId.
        #
        # The value you sent for the onUpdate parameter when you created the payment plan indicates what happens to the
        # associated subscriptions when you update the plan:
        # - `update` - Our gateway updates the subscriptions associated with the payment plan.
        # - `continue` - Our  gateway doesn't update the subscriptions associated with the payment plan.
        #
        # @param request_options [Hash]
        # @param params [Payroc::Types::PatchRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :processing_terminal_id
        # @option params [String] :payment_plan_id
        # @option params [String] :idempotency_key
        #
        # @return [Payroc::Types::PaymentPlan]
        def partially_update(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          path_param_names = %i[processing_terminal_id payment_plan_id]
          body_params = params.except(*path_param_names)

          headers = {}
          headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "PATCH",
            path: "processing-terminals/#{params[:processing_terminal_id]}/payment-plans/#{params[:payment_plan_id]}",
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
            Payroc::Types::PaymentPlan.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
