# frozen_string_literal: true

module Payroc
  module Payments
    module Subscriptions
      class Client
        # @param client [Payroc::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of subscriptions.
        #
        # Note: If you want to view the details of a specific subscription and you have its subscriptionId, use our
        # [Retrieve subscription](https://docs.payroc.com/api/schema/repeat-payments/subscriptions/retrieve) method.
        #
        # Use query parameters to filter the list of results that we return, for example, to search for subscriptions
        # for a customer, a payment plan, or frequency.
        #
        # Our gateway returns information about the following for each subscription in the list:
        #
        # -	Payment plan the subscription is linked to.
        # -	Secure token that represents cardholder’s payment details.
        # -	Current state of the subscription, including its status, next due date, and invoices.
        # -	Fees for setup and the cost of the recurring order.
        # -	Subscription length, end date, and frequency.
        #
        # For each subscription, we also return the subscriptionId, the paymentPlanId, and the secureTokenId, which you
        # can use to perform follow-actions.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :processing_terminal_id
        # @option params [String, nil] :customer_name
        # @option params [String, nil] :last_4
        # @option params [String, nil] :payment_plan
        # @option params [Payroc::Payments::Subscriptions::Types::ListSubscriptionsRequestFrequency, nil] :frequency
        # @option params [Payroc::Payments::Subscriptions::Types::ListSubscriptionsRequestStatus, nil] :status
        # @option params [String, nil] :end_date
        # @option params [String, nil] :next_due_date
        # @option params [String, nil] :before
        # @option params [String, nil] :after
        # @option params [Integer, nil] :limit
        #
        # @return [Payroc::Types::SubscriptionPaginatedList]
        def list(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.symbolize_keys(params)
          query_param_names = %i[customer_name last_4 payment_plan frequency status end_date next_due_date before after limit]
          query_params = {}
          query_params["customerName"] = params[:customer_name] if params.key?(:customer_name)
          query_params["last4"] = params[:last_4] if params.key?(:last_4)
          query_params["paymentPlan"] = params[:payment_plan] if params.key?(:payment_plan)
          query_params["frequency"] = params[:frequency] if params.key?(:frequency)
          query_params["status"] = params[:status] if params.key?(:status)
          query_params["endDate"] = params[:end_date] if params.key?(:end_date)
          query_params["nextDueDate"] = params[:next_due_date] if params.key?(:next_due_date)
          query_params["before"] = params[:before] if params.key?(:before)
          query_params["after"] = params[:after] if params.key?(:after)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          params = params.except(*query_param_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "GET",
            path: "processing-terminals/#{params[:processing_terminal_id]}/subscriptions",
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
            parsed_response = Payroc::Types::SubscriptionPaginatedList.load(response.body)
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

        # Use this method to assign a customer to a payment plan.
        #
        # **Note:** This method is part of our Repeat Payments feature. To help you understand how this method works
        # with our Payment plans endpoints, go to [Repeat
        # Payments](https://docs.payroc.com/guides/integrate/repeat-payments).
        #
        # When you create a subscription you need to provide a unique subscriptionId that you use to run follow-on
        # actions:
        #
        # - [Retrieve Subscription](https://docs.payroc.com/api/schema/repeat-payments/subscriptions/retrieve) - View
        # the details of the subscription.
        # - [Update Subscription](https://docs.payroc.com/api/schema/repeat-payments/subscriptions/partially-update) -
        # Update the details of the subscription.
        # - [Deactivate Subscription](https://docs.payroc.com/api/schema/repeat-payments/subscriptions/deactivate) -
        # Stop taking payments for the subscription.
        # - [Re-activate Subscription](https://docs.payroc.com/api/schema/payments/subscriptions/reactivate) - Start
        # taking payments again for the subscription.
        # - [Pay Manual Subscription](https://docs.payroc.com/api/schema/repeat-payments/subscriptions/pay) - Manually
        # collect a payment for the subscription.
        #
        # The request includes the following settings:
        # - **paymentPlanId** - Unique identifier of the payment plan that the merchant wants to use. If you don't have
        # the paymentPlanId, use our [List Payment
        # Plans](https://docs.payroc.com/api/schema/repeat-payments/payment-plans/list) method to search for the payment
        # plan.
        # - **paymentMethod** - Object that contains information about the secure token, which represents the customer's
        # card details or bank account details.
        # - **startDate** - Date that you want to start to take payments.
        #
        # You can also update the settings that the subscription inherited from the payment plan, for example, you can
        # change the amount for each payment. If you change the settings for the subscription, it doesn't change the
        # settings in the payment plan that it's linked to.
        #
        # @param request_options [Hash]
        # @param params [Payroc::Payments::Subscriptions::Types::SubscriptionRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :processing_terminal_id
        # @option params [String] :idempotency_key
        #
        # @return [Payroc::Types::Subscription]
        def create(request_options: {}, **params)
          path_param_names = %i[processing_terminal_id]
          body_params = params.except(*path_param_names)
          body_prop_names = %i[subscription_id payment_plan_id payment_method name description setup_order recurring_order start_date end_date length pause_collection_for custom_fields]
          body_bag = body_params.slice(*body_prop_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "POST",
            path: "processing-terminals/#{params[:processing_terminal_id]}/subscriptions",
            body: Payroc::Payments::Subscriptions::Types::SubscriptionRequest.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::Subscription.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to retrieve information about a subscription.
        #
        # To retrieve a subscription, you need its subscriptionId. You sent the subscriptionId in the request of the
        # [Create subscription](https://docs.payroc.com/api/schema/repeat-payments/subscriptions/create) method.
        #
        # **Note:** If you don't have the subscriptionId, use our [List
        # subscriptions](https://docs.payroc.com/api/schema/repeat-payments/subscriptions/list) method to search for the
        # subscription.
        #
        # Our gateway returns information about the following for the subscription:
        #
        # -	Payment plan the subscription is linked to.
        # -	Secure token that represents cardholder’s payment details.
        # -	Current state of the subscription, including its status, next due date, and invoices.
        # -	Fees for setup and the cost of the recurring order.
        # -	Subscription length, end date, and frequency.
        #
        # We also return the paymentPlanId and the secureTokenId, which you can use to perform follow-on actions.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :processing_terminal_id
        # @option params [String] :subscription_id
        #
        # @return [Payroc::Types::Subscription]
        def retrieve(request_options: {}, **params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "GET",
            path: "processing-terminals/#{params[:processing_terminal_id]}/subscriptions/#{params[:subscription_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::Subscription.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to partially update a subscription. Structure your request to follow the [RFC
        # 6902](https://datatracker.ietf.org/doc/html/rfc6902) standard.
        #
        # To update a subscription, you need its subscriptionId, which you sent in the request of the [Create
        # subscription](https://docs.payroc.com/api/schema/repeat-payments/subscriptions/create) method.
        #
        # **Note:** If you don't have the subscriptionId, use our [List
        # subscriptions](https://docs.payroc.com/api/schema/repeat-payments/subscriptions/list) method to search for the
        # payment.
        #
        # You can update all of the properties of the subscription except for the following:
        #
        # **Can't delete**
        # - recurringOrder
        # - description
        # - name
        #
        # **Can't perform any PATCH operation**
        # - currentState
        # - type
        # - frequency
        # - paymentPlan
        #
        # @param request_options [Hash]
        # @param params [Payroc::Types::PatchRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :processing_terminal_id
        # @option params [String] :subscription_id
        # @option params [String] :idempotency_key
        #
        # @return [Payroc::Types::Subscription]
        def partially_update(request_options: {}, **params)
          path_param_names = %i[processing_terminal_id subscription_id]
          body_params = params.except(*path_param_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "PATCH",
            path: "processing-terminals/#{params[:processing_terminal_id]}/subscriptions/#{params[:subscription_id]}",
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
            Payroc::Types::Subscription.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to deactivate a subscription.
        #
        # To deactivate a subscription, you need its subscriptionId, which you sent in the request of the [Create
        # Subscription](https://docs.payroc.com/api/schema/repeat-payments/subscriptions/create) method.
        #
        # **Note:** If you don't have the subscriptionId, use our [List
        # Subscriptions](https://docs.payroc.com/api/schema/repeat-payments/subscriptions/list) method to search for the
        # subscription.
        #
        # If your request is successful, our gateway stops taking payments from the customer.
        #
        # To reactivate the subscription, use our [Reactivate
        # Subscription](https://docs.payroc.com/api/schema/payments/subscriptions/reactivate) method.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :processing_terminal_id
        # @option params [String] :subscription_id
        #
        # @return [Payroc::Types::Subscription]
        def deactivate(request_options: {}, **params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "POST",
            path: "processing-terminals/#{params[:processing_terminal_id]}/subscriptions/#{params[:subscription_id]}/deactivate",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::Subscription.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to reactivate a subscription.
        #
        # To reactivate a subscription, you need its subscriptionId, which you sent in the request of the [Create
        # Subscription](https://docs.payroc.com/api/schema/repeat-payments/subscriptions/create) method.
        #
        # **Note:** If you don't have the subscriptionId, use our [List
        # Subscriptions](https://docs.payroc.com/api/schema/repeat-payments/subscriptions/list) method to search for the
        # subscription.
        #
        # If your request is successful, our gateway restarts taking payments from the customer.
        #
        # To deactivate the subscription, use our [Deactivate
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
        # @option params [String] :subscription_id
        #
        # @return [Payroc::Types::Subscription]
        def reactivate(request_options: {}, **params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "POST",
            path: "processing-terminals/#{params[:processing_terminal_id]}/subscriptions/#{params[:subscription_id]}/reactivate",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::Subscription.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to manually collect a payment linked to a subscription. You can manually collect a payment
        # only if the merchant chose not to let our gateway automatically collect each payment.
        #
        # To manually collect a payment, you need the subscriptionId of the subscription that's linked to the payment.
        # You sent the subscriptionId in the request of the [Create
        # Subscription](https://docs.payroc.com/api/schema/repeat-payments/subscriptions/create) method.
        #
        # **Note:** If you don't have the subscriptionId, use our [List
        # Subscriptions](https://docs.payroc.com/api/schema/repeat-payments/subscriptions/list) method to search for the
        # subscription.
        #
        # The request includes an order object that contains information about the amount that you want to collect.
        #
        # In the response, our gateway returns information about the payment and a paymentId. You can use the paymentId
        # in follow-on actions with the [Payments](https://docs.payroc.com/api/schema/payments) endpoints or [Bank
        # Transfer Payments](https://docs.payroc.com/api/schema/payments/bank-transfer-payments) endpoints.
        #
        # @param request_options [Hash]
        # @param params [Payroc::Payments::Subscriptions::Types::SubscriptionPaymentRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :processing_terminal_id
        # @option params [String] :subscription_id
        # @option params [String] :idempotency_key
        #
        # @return [Payroc::Types::SubscriptionPayment]
        def pay(request_options: {}, **params)
          path_param_names = %i[processing_terminal_id subscription_id]
          body_params = params.except(*path_param_names)
          body_prop_names = %i[operator order custom_fields]
          body_bag = body_params.slice(*body_prop_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "POST",
            path: "processing-terminals/#{params[:processing_terminal_id]}/subscriptions/#{params[:subscription_id]}/pay",
            body: Payroc::Payments::Subscriptions::Types::SubscriptionPaymentRequest.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::SubscriptionPayment.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
