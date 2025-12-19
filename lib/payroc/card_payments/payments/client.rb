# frozen_string_literal: true

module Payroc
  module CardPayments
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
        # Payment](https://docs.payroc.com/api/schema/card-payments/payments/retrieve) method.
        #
        # Use query parameters to filter the list of results that we return, for example, to search for payments for a
        # customer, a tip mode, or a date range.
        #
        # Our gateway returns the following information about each payment in the list:
        #
        # - Order details, including the transaction amount and when it was processed.
        # - Payment card details, including the masked card number, expiry date, and payment method.
        # - Cardholder details, including their contact information and shipping address.
        # - Payment details, including the payment type, status, and response.
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
        # @option params [String, nil] :processing_terminal_id
        # @option params [String, nil] :order_id
        # @option params [String, nil] :operator
        # @option params [String, nil] :cardholder_name
        # @option params [String, nil] :first_6
        # @option params [String, nil] :last_4
        # @option params [Payroc::CardPayments::Payments::Types::ListPaymentsRequestTender, nil] :tender
        # @option params [Payroc::CardPayments::Payments::Types::ListPaymentsRequestTipModeItem, nil] :tip_mode
        # @option params [Payroc::CardPayments::Payments::Types::ListPaymentsRequestTypeItem, nil] :type
        # @option params [Payroc::CardPayments::Payments::Types::ListPaymentsRequestStatusItem, nil] :status
        # @option params [String, nil] :date_from
        # @option params [String, nil] :date_to
        # @option params [Payroc::CardPayments::Payments::Types::ListPaymentsRequestSettlementState, nil] :settlement_state
        # @option params [String, nil] :settlement_date
        # @option params [String, nil] :payment_link_id
        # @option params [String, nil] :before
        # @option params [String, nil] :after
        # @option params [Integer, nil] :limit
        #
        # @return [Payroc::Types::PaymentPaginatedListForRead]
        def list(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[processing_terminal_id order_id operator cardholder_name first_6 last_4 tender tip_mode type status date_from date_to settlement_state settlement_date payment_link_id before after limit]
          query_params = {}
          query_params["processingTerminalId"] = params[:processing_terminal_id] if params.key?(:processing_terminal_id)
          query_params["orderId"] = params[:order_id] if params.key?(:order_id)
          query_params["operator"] = params[:operator] if params.key?(:operator)
          query_params["cardholderName"] = params[:cardholder_name] if params.key?(:cardholder_name)
          query_params["first6"] = params[:first_6] if params.key?(:first_6)
          query_params["last4"] = params[:last_4] if params.key?(:last_4)
          query_params["tender"] = params[:tender] if params.key?(:tender)
          query_params["tipMode"] = params[:tip_mode] if params.key?(:tip_mode)
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
            path: "payments",
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
            parsed_response = Payroc::Types::PaymentPaginatedListForRead.load(response.body)
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

        # Use this method to run a sale or a pre-authorization with a customer's payment card.
        #
        # In the response, our gateway returns information about the card payment and a paymentId, which you need for
        # the following methods:
        #
        # -	[Retrieve payment](https://docs.payroc.com/api/schema/card-payments/payments/retrieve) - View the details of
        # the card payment.
        # -	[Adjust payment](https://docs.payroc.com/api/schema/card-payments/payments/adjust) - Update the details of
        # the card payment.
        # -	[Capture payment](https://docs.payroc.com/api/schema/card-payments/payments/capture)  - Capture the
        # pre-authorization.
        # -	[Reverse payment](https://docs.payroc.com/api/schema/card-payments/refunds/reverse)  - Cancel the card
        # payment if it's in an open batch.
        # -	[Refund payment](https://docs.payroc.com/api/schema/card-payments/refunds/create-referenced-refund)  - Run a
        # referenced refund to return funds to the payment card.
        #
        # **Payment methods**
        #
        # - **Cards** - Credit, debit, and EBT
        # - **Digital wallets** - [Apple Pay®](https://docs.payroc.com/guides/integrate/apple-pay) and [Google
        # Pay®](https://docs.payroc.com/guides/integrate/google-pay)
        # - **Tokens** - Secure tokens and single-use tokens
        #
        # **Features**
        #
        # Our Create Payment method also supports the following features:
        #
        # - [Repeat payments](https://docs.payroc.com/guides/integrate/repeat-payments/use-your-own-software) - Run
        # multiple payments as part of a payment schedule that you manage with your own software.
        # - **Offline sales** - Run a sale or a pre-authorization if the terminal loses its connection to our gateway.
        # - [Tokenization](https://docs.payroc.com/guides/integrate/save-payment-details) - Save card details to use in
        # future transactions.
        # - [3-D Secure](https://docs.payroc.com/guides/integrate/3-d-secure) - Verify the identity of the cardholder.
        # - [Custom fields](https://docs.payroc.com/guides/integrate/add-custom-fields) - Add your own data to a
        # payment.
        # - **Tips** - Add tips to the card payment.
        # - **Taxes** - Add local taxes to the card payment.
        # - **Surcharging** - Add a surcharge to the card payment.
        # - **Dual pricing** - Offer different prices based on payment method, for example, if you use our RewardPay
        # Choice pricing program.
        #
        # @param request_options [Hash]
        # @param params [Payroc::CardPayments::Payments::Types::PaymentRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :idempotency_key
        #
        # @return [Payroc::Types::Payment]
        def create(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          body_prop_names = %i[channel processing_terminal_id operator order customer ip_address payment_method three_d_secure credential_on_file offline_processing auto_capture process_as_sale custom_fields]
          body_bag = params.slice(*body_prop_names)

          headers = {}
          headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "POST",
            path: "payments",
            headers: headers,
            body: Payroc::CardPayments::Payments::Types::PaymentRequest.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::Payment.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to retrieve information about a card payment.
        #
        # To retrieve a payment, you need its paymentId. Our gateway returned the paymentId in the response of the
        # [Create Payment](https://docs.payroc.com/api/schema/card-payments/payments/create) method.
        #
        # **Note:** If you don't have the paymentId, use our [List
        # Payments](https://docs.payroc.com/api/schema/card-payments/payments/list) method to search for the payment.
        #
        # Our gateway returns the following information about the payment:
        #
        # - Order details, including the transaction amount and when it was processed.
        # - Payment card details, including the masked card number, expiry date, and payment method.
        # - Cardholder details, including their contact information and shipping address.
        # - Payment details, including the payment type, status, and response.
        #
        # If the merchant saved the customer's card details, our gateway returns a secureTokenID, which you can use to
        # perform follow-on actions.
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
        # @return [Payroc::Types::RetrievedPayment]
        def retrieve(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "GET",
            path: "payments/#{params[:payment_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::RetrievedPayment.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to adjust a payment in an open batch.
        #
        # To adjust a payment, you need its paymentId. Our gateway returned the paymentId in the response of the [Create
        # Payment](https://docs.payroc.com/api/schema/card-payments/payments/create) method.
        #
        # **Note:** If you don't have the paymentId, use our [List
        # Payments](https://docs.payroc.com/api/schema/card-payments/payments/list) method to search for the payment.
        #
        # You can adjust the following details of the payment:
        # - Sale amount and tip amount
        # - Payment status
        # - Cardholder shipping address and contact information
        # - Cardholder signature data
        #
        # Our gateway returns information about the adjusted payment, including information about the payment card and
        # the cardholder.
        #
        # @param request_options [Hash]
        # @param params [Payroc::CardPayments::Payments::Types::PaymentAdjustment]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :payment_id
        # @option params [String] :idempotency_key
        #
        # @return [Payroc::Types::Payment]
        def adjust(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          path_param_names = %i[payment_id]
          body_params = params.except(*path_param_names)
          body_prop_names = %i[operator adjustments]
          body_bag = body_params.slice(*body_prop_names)

          headers = {}
          headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "POST",
            path: "payments/#{params[:payment_id]}/adjust",
            headers: headers,
            body: Payroc::CardPayments::Payments::Types::PaymentAdjustment.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::Payment.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to capture a pre-authorization.
        #
        # To capture a pre-authorization, you need its paymentId. Our gateway returned the paymentId in the response of
        # the [Create Payment](https://docs.payroc.com/api/schema/card-payments/payments/create) method.
        #
        # **Note:** If you don't have the paymentId, use our [List
        # Payments](https://docs.payroc.com/api/schema/card-payments/payments/list) method to search for the payment.
        #
        # Depending on the amount you want to capture, complete the following:
        # -	**Capture the full amount of the pre-authorization** - Don't send a value for the amount parameter in your
        # request.
        # -	**Capture less than the amount of the pre-authorization** - Send a value for the amount parameter in your
        # request.
        # -	**Capture more than the amount of the pre-authorization** - Adjust the pre-authorization before you capture
        # it. For more information about adjusting a pre-authorization, go to [Adjust
        # Payment](https://docs.payroc.com/api/schema/card-payments/payments/adjust).
        #
        # If your request is successful, our gateway takes the amount from the payment card.
        #
        # **Note:** For more information about pre-authorizations and captures, go to [Run a
        # pre-authorization](https://docs.payroc.com/guides/integrate/run-a-pre-authorization).
        #
        # @param request_options [Hash]
        # @param params [Payroc::CardPayments::Payments::Types::PaymentCapture]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :payment_id
        # @option params [String] :idempotency_key
        #
        # @return [Payroc::Types::Payment]
        def capture(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          path_param_names = %i[payment_id]
          body_params = params.except(*path_param_names)
          body_prop_names = %i[processing_terminal_id operator amount breakdown]
          body_bag = body_params.slice(*body_prop_names)

          headers = {}
          headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "POST",
            path: "payments/#{params[:payment_id]}/capture",
            headers: headers,
            body: Payroc::CardPayments::Payments::Types::PaymentCapture.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::Payment.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
