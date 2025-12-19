# frozen_string_literal: true

module Payroc
  module BankTransferPayments
    module Payments
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

        # Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of payments.
        #
        # **Note:** If you want to view the details of a specific payment and you have its paymentId, use our [Retrieve
        # Payment](https://docs.payroc.com/api/schema/bank-transfer-payments/payments/retrieve) method.
        #
        # Use query parameters to filter the list of results that we return, for example, to search for payments for a
        # customer, a date range, or a settlement state.
        #
        # Our gateway returns the following information about each payment in the list:
        #
        # - Order details, including the transaction amount and when it was processed.
        # - Bank account details, including the customer’s name and account number.
        # - Customer's details, including the customer’s phone number.
        # - Transaction details, including any refunds or re-presentments.
        #
        # For each transaction, we also return the paymentId and an optional secureTokenId, which you can use to perform
        # follow-on actions.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :processing_terminal_id
        # @option params [String, nil] :order_id
        # @option params [String, nil] :name_on_account
        # @option params [String, nil] :last_4
        # @option params [Payroc::BankTransferPayments::Payments::Types::ListPaymentsRequestTypeItem, nil] :type
        # @option params [Payroc::BankTransferPayments::Payments::Types::ListPaymentsRequestStatusItem, nil] :status
        # @option params [String, nil] :date_from
        # @option params [String, nil] :date_to
        # @option params [Payroc::BankTransferPayments::Payments::Types::ListPaymentsRequestSettlementState, nil] :settlement_state
        # @option params [String, nil] :settlement_date
        # @option params [String, nil] :payment_link_id
        # @option params [String, nil] :before
        # @option params [String, nil] :after
        # @option params [Integer, nil] :limit
        #
        # @return [Payroc::Types::BankTransferPaymentPaginatedList]
        def list(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[processing_terminal_id order_id name_on_account last_4 type status date_from date_to settlement_state settlement_date payment_link_id before after limit]
          query_params = {}
          query_params["processingTerminalId"] = params[:processing_terminal_id] if params.key?(:processing_terminal_id)
          query_params["orderId"] = params[:order_id] if params.key?(:order_id)
          query_params["nameOnAccount"] = params[:name_on_account] if params.key?(:name_on_account)
          query_params["last4"] = params[:last_4] if params.key?(:last_4)
          query_params["type"] = params[:type] if params.key?(:type)
          query_params["status"] = params[:status] if params.key?(:status)
          query_params["dateFrom"] = params[:date_from] if params.key?(:date_from)
          query_params["dateTo"] = params[:date_to] if params.key?(:date_to)
          query_params["settlementState"] = params[:settlement_state] if params.key?(:settlement_state)
          query_params["settlementDate"] = params[:settlement_date] if params.key?(:settlement_date)
          query_params["paymentLinkId"] = params[:payment_link_id] if params.key?(:payment_link_id)
          query_params["before"] = params[:before] if params.key?(:before)
          query_params["after"] = params[:after] if params.key?(:after)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          params.except(*query_param_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "GET",
            path: "bank-transfer-payments",
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
            parsed_response = Payroc::Types::BankTransferPaymentPaginatedList.load(response.body)
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

        # Use this method to run a sale with a customer's bank account details.
        #
        # In the response, our gateway returns information about the bank transfer payment and a paymentId, which you
        # need for the following methods:
        # -	[Retrieve payment](https://docs.payroc.com/api/schema/bank-transfer-payments/payments/retrieve) - View the
        # details of the bank transfer payment.
        # -	[Reverse payment](https://docs.payroc.com/api/schema/bank-transfer-payments/refunds/reverse-payment) -
        # Cancel the bank transfer payment if it's an open batch.
        # -	[Refund payment](https://docs.payroc.com/api/schema/bank-transfer-payments/refunds/refund) - Run a
        # referenced refund to return funds to the customer's bank account.
        #
        # **Payment methods**
        #
        # Our gateway accepts the following payment methods:
        # -	Automated clearing house (ACH) details
        # -	Pre-authorized debit (PAD) details
        #
        # You can also use [secure tokens](https://docs.payroc.com/api/schema/payments/secure-tokens/overview) and
        # [single-use tokens](https://docs.payroc.com/api/schema/tokenization/single-use-tokens/create) that you created
        # from ACH details or PAD details.
        #
        # @param request_options [Hash]
        # @param params [Payroc::BankTransferPayments::Payments::Types::BankTransferPaymentRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :idempotency_key
        #
        # @return [Payroc::Types::BankTransferPayment]
        def create(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          body_prop_names = %i[processing_terminal_id order customer credential_on_file payment_method custom_fields]
          body_bag = params.slice(*body_prop_names)

          headers = {}
          headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "POST",
            path: "bank-transfer-payments",
            headers: headers,
            body: Payroc::BankTransferPayments::Payments::Types::BankTransferPaymentRequest.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::BankTransferPayment.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to retrieve information about a bank transfer payment.
        #
        # To retrieve a payment, you need its paymentId. Our gateway returned the paymentId in the response of the
        # [Create Payment](https://docs.payroc.com/api/schema/bank-transfer-payments/payments/create) method.
        #
        # Note: If you don’t have the paymentId, use our [List
        # Payments](https://docs.payroc.com/api/schema/bank-transfer-payments/payments/list) method to search for the
        # payment.
        #
        # Our gateway returns the following information about the payment:
        #
        # -	Order details, including the transaction amount and when it was processed.
        # -	Bank account details, including the customer’s name and account number.
        # -	Customer’s details, including the customer’s phone number.
        # -	Transaction details, including any refunds or re-presentments.
        #
        # If the merchant saved the customer’s bank account details, our gateway returns a secureTokenID, which you can
        # use to perform follow-on actions.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :payment_id
        #
        # @return [Payroc::Types::BankTransferPayment]
        def retrieve(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "GET",
            path: "bank-transfer-payments/#{params[:payment_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::BankTransferPayment.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to re-present an ACH payment.
        #
        # To re-present a payment, you need the paymentId of the return. To get the paymentId of the return, complete
        # the following steps:
        #
        # 1.	Use our [Retrieve Payment](https://docs.payroc.com/api/schema/bank-transfer-payments/payments/retrieve)
        # method  to view the details of the original payment.
        # 2.	From the [returns
        # object](https://docs.payroc.com/api/schema/bank-transfer-payments/payments/retrieve#response.body.returns) in
        # the response, get the paymentId of the return.
        #
        # Our gateway uses the bank account details from the original payment. If you want to update the customer's bank
        # account details, send the new bank account details in the request.
        #
        # If your request is successful, our gateway re-presents the payment.
        #
        # @param request_options [Hash]
        # @param params [Payroc::BankTransferPayments::Payments::Types::Representment]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :payment_id
        # @option params [String] :idempotency_key
        #
        # @return [Payroc::Types::BankTransferPayment]
        def represent(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          path_param_names = %i[payment_id]
          body_params = params.except(*path_param_names)
          body_prop_names = %i[payment_method]
          body_bag = body_params.slice(*body_prop_names)

          headers = {}
          headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "POST",
            path: "bank-transfer-payments/#{params[:payment_id]}/represent",
            headers: headers,
            body: Payroc::BankTransferPayments::Payments::Types::Representment.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::BankTransferPayment.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
