# frozen_string_literal: true

module Payroc
  module Payments
    module Refunds
      class Client
        # @param client [Payroc::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of refunds.
        #
        # **Note:** If you want to view the details of a specific refund and you have its refundId, use our [Retrieve
        # Refund](https://docs.payroc.com/api/schema/card-payments/refunds/retrieve) method.
        #
        # Use query parameters to filter the list of results that we return, for example, to search for refunds for a
        # customer, a tender type, or a date range.
        # Our gateway returns the following information about each refund in the list:
        # - Order details, including the refund amount and when we processed the refund.
        # - Payment card details, including the masked card number, expiry date, and payment method.
        # - Cardholder details, including their contact information and shipping address.
        #
        # For referenced refunds, our gateway also returns details about the payment that the refund is linked to.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String, nil] :processing_terminal_id
        # @option params [String, nil] :order_id
        # @option params [String, nil] :operator
        # @option params [String, nil] :cardholder_name
        # @option params [String, nil] :first_6
        # @option params [String, nil] :last_4
        # @option params [Payroc::Payments::Refunds::Types::ListRefundsRequestTender, nil] :tender
        # @option params [Payroc::Payments::Refunds::Types::ListRefundsRequestStatusItem, nil] :status
        # @option params [String, nil] :date_from
        # @option params [String, nil] :date_to
        # @option params [Payroc::Payments::Refunds::Types::ListRefundsRequestSettlementState, nil] :settlement_state
        # @option params [String, nil] :settlement_date
        # @option params [String, nil] :before
        # @option params [String, nil] :after
        # @option params [Integer, nil] :limit
        #
        # @return [Payroc::Types::RefundPaginatedList]
        def list(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.symbolize_keys(params)
          query_param_names = %i[processing_terminal_id order_id operator cardholder_name first_6 last_4 tender status date_from date_to settlement_state settlement_date before after limit]
          query_params = {}
          query_params["processingTerminalId"] = params[:processing_terminal_id] if params.key?(:processing_terminal_id)
          query_params["orderId"] = params[:order_id] if params.key?(:order_id)
          query_params["operator"] = params[:operator] if params.key?(:operator)
          query_params["cardholderName"] = params[:cardholder_name] if params.key?(:cardholder_name)
          query_params["first6"] = params[:first_6] if params.key?(:first_6)
          query_params["last4"] = params[:last_4] if params.key?(:last_4)
          query_params["tender"] = params[:tender] if params.key?(:tender)
          query_params["status"] = params[:status] if params.key?(:status)
          query_params["dateFrom"] = params[:date_from] if params.key?(:date_from)
          query_params["dateTo"] = params[:date_to] if params.key?(:date_to)
          query_params["settlementState"] = params[:settlement_state] if params.key?(:settlement_state)
          query_params["settlementDate"] = params[:settlement_date] if params.key?(:settlement_date)
          query_params["before"] = params[:before] if params.key?(:before)
          query_params["after"] = params[:after] if params.key?(:after)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          params.except(*query_param_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "GET",
            path: "refunds",
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
            parsed_response = Payroc::Types::RefundPaginatedList.load(response.body)
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

        # Use this method to create an unreferenced refund. An unreferenced refund is a refund that isn't linked to a
        # payment.
        #
        # **Note:** If you have the paymentId of the payment you want to refund, use our [Refund
        # Payment](https://docs.payroc.com/api/schema/card-payments/refunds/create-referenced-refund) method. If you use
        # our Refund Payment method, our gateway sends the refund amount to the customer's original payment method and
        # links the refund to the payment.
        #
        # In the request, you must provide the customer's payment details and the refund amount.
        #
        # In the response, our gateway returns information about the refund and a refundId, which you need for the
        # following methods:
        #
        # - [Retrieve refund](https://docs.payroc.com/api/schema/card-payments/refunds/retrieve) - View the details of
        # the refund.
        # - [Adjust refund](https://docs.payroc.com/api/schema/card-payments/refunds/adjust) - Update the details of the
        # refund.
        # - [Reverse refund](https://docs.payroc.com/api/schema/card-payments/refunds/reverse-refund) - Cancel the
        # refund if it's in an open batch.
        #
        # @param request_options [Hash]
        # @param params [Payroc::Payments::Refunds::Types::UnreferencedRefund]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :idempotency_key
        #
        # @return [Payroc::Types::RetrievedRefund]
        def create(request_options: {}, **params)
          body_prop_names = %i[channel processing_terminal_id operator order customer ip_address refund_method custom_fields]
          body_bag = params.slice(*body_prop_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "POST",
            path: "refunds",
            body: Payroc::Payments::Refunds::Types::UnreferencedRefund.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::RetrievedRefund.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to retrieve information about a refund.
        #
        # To retrieve a refund, you need its refundId. Our gateway returned the refundId in the response of the [Refund
        # Payment](https://docs.payroc.com/api/schema/card-payments/refunds/create-referenced-refund) method or the
        # [Create Refund](https://docs.payroc.com/api/schema/card-payments/refunds/create-unreferenced-refund) method.
        #
        # **Note:** If you don't have the refundId, use our [List
        # Refunds](https://docs.payroc.com/api/schema/card-payments/refunds/list) method to search for the refund.
        #
        # Our gateway returns the following information about the refund:
        # - Order details, including the refund amount and when we processed the refund.
        # - Payment card details, including the masked card number, expiry date, and payment method.
        # - Cardholder details, including their contact information and shipping address.
        #
        # If the refund is a referenced refund, our gateway also returns details about the payment that the refund is
        # linked to.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :refund_id
        #
        # @return [Payroc::Types::RetrievedRefund]
        def retrieve(request_options: {}, **params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "GET",
            path: "refunds/#{params[:refund_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::RetrievedRefund.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to adjust a refund in an open batch.
        #
        # To adjust a refund, you need its refundId. Our gateway returned the refundId in the response of the [Refund
        # Payment](https://docs.payroc.com/api/schema/card-payments/refunds/create-referenced-refund) method or the
        # [Create Refund](https://docs.payroc.com/api/schema/card-payments/refunds/create-unreferenced-refund) method.
        #
        # **Note:** If you don’t have the refundId, use our [List
        # Refunds](https://docs.payroc.com/api/schema/card-payments/refunds/list) method to search for the refund.
        #
        # You can adjust the following details of the refund:
        # - Customer details, including shipping address and contact information.
        # - Status of the refund.
        #
        # Our gateway returns information about the adjusted refund, including:
        # - Order details, including the refund amount and when we processed the refund.
        # - Payment card details, including the masked card number, expiry date, and payment method.
        # - Cardholder details, including their contact information and shipping address.
        #
        # If the refund is a referenced refund, our gateway also returns details about the payment that the refund is
        # linked to.
        #
        # @param request_options [Hash]
        # @param params [Payroc::Payments::Refunds::Types::RefundAdjustment]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :refund_id
        # @option params [String] :idempotency_key
        #
        # @return [Payroc::Types::RetrievedRefund]
        def adjust(request_options: {}, **params)
          path_param_names = %i[refund_id]
          body_params = params.except(*path_param_names)
          body_prop_names = %i[operator adjustments]
          body_bag = body_params.slice(*body_prop_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "POST",
            path: "refunds/#{params[:refund_id]}/adjust",
            body: Payroc::Payments::Refunds::Types::RefundAdjustment.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::RetrievedRefund.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to cancel a refund in an open batch.
        #
        # To cancel a refund, you need its refundId. Our gateway returned the refundId in the response of the [Refund
        # Payment](https://docs.payroc.com/api/schema/card-payments/refunds/create-referenced-refund) or [Create
        # Refund](https://docs.payroc.com/api/schema/card-payments/refunds/create-unreferenced-refund) method.
        #
        # **Note:** If you don’t have the refundId, use our [List
        # Refunds](https://docs.payroc.com/api/schema/card-payments/refunds/list) method to search for the refund.
        #
        # If your request is successful, the gateway removes the refund from the merchant’s open batch and no funds are
        # returned to the cardholder’s account.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :refund_id
        # @option params [String] :idempotency_key
        #
        # @return [Payroc::Types::RetrievedRefund]
        def reverse(request_options: {}, **params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "POST",
            path: "refunds/#{params[:refund_id]}/reverse",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::RetrievedRefund.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
