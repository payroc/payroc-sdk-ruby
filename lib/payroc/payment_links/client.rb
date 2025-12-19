# frozen_string_literal: true

module Payroc
  module PaymentLinks
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

      # Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of payment links linked to
      # a processing terminal.
      #
      # **Note:** If you want to view the details of a specific payment link and you have its paymentLinkId, use our
      # [Retrieve Payment Link](https://docs.payroc.com/api/schema/payment-links/retrieve) method.
      #
      # Use query parameters to filter the list of results that we return, for example, to search for only active links
      # or multi-use links.
      #
      # Our gateway returns the following information about each payment link in the list:
      # - **type** - Indicates whether the link can be used only once or if it can be used multiple times.
      # - **authType** - Indicates whether the transaction is a sale or a pre-authorization.
      # - **paymentMethods** - Indicates the payment method that the merchant accepts.
      # - **charge** - Indicates whether the merchant or the customer enters the amount for the transaction.
      # - **status** - Indicates if the payment link is active.
      #
      # For each payment link, we also return a paymentLinkId, which you can use for follow-on actions.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :processing_terminal_id
      # @option params [String, nil] :merchant_reference
      # @option params [Payroc::PaymentLinks::Types::ListPaymentLinksRequestLinkType, nil] :link_type
      # @option params [Payroc::PaymentLinks::Types::ListPaymentLinksRequestChargeType, nil] :charge_type
      # @option params [Payroc::PaymentLinks::Types::ListPaymentLinksRequestStatus, nil] :status
      # @option params [String, nil] :recipient_name
      # @option params [String, nil] :recipient_email
      # @option params [String, nil] :created_on
      # @option params [String, nil] :expires_on
      # @option params [String, nil] :before
      # @option params [String, nil] :after
      # @option params [Integer, nil] :limit
      #
      # @return [Payroc::Types::PaymentLinkPaginatedList]
      def list(request_options: {}, **params)
        params = Payroc::Internal::Types::Utils.normalize_keys(params)
        query_param_names = %i[merchant_reference link_type charge_type status recipient_name recipient_email created_on expires_on before after limit]
        query_params = {}
        query_params["merchantReference"] = params[:merchant_reference] if params.key?(:merchant_reference)
        query_params["linkType"] = params[:link_type] if params.key?(:link_type)
        query_params["chargeType"] = params[:charge_type] if params.key?(:charge_type)
        query_params["status"] = params[:status] if params.key?(:status)
        query_params["recipientName"] = params[:recipient_name] if params.key?(:recipient_name)
        query_params["recipientEmail"] = params[:recipient_email] if params.key?(:recipient_email)
        query_params["createdOn"] = params[:created_on] if params.key?(:created_on)
        query_params["expiresOn"] = params[:expires_on] if params.key?(:expires_on)
        query_params["before"] = params[:before] if params.key?(:before)
        query_params["after"] = params[:after] if params.key?(:after)
        query_params["limit"] = params[:limit] if params.key?(:limit)
        params = params.except(*query_param_names)

        request = Payroc::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
          method: "GET",
          path: "processing-terminals/#{params[:processing_terminal_id]}/payment-links",
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
          parsed_response = Payroc::Types::PaymentLinkPaginatedList.load(response.body)
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

      # Use this method to create a payment link that a customer can use to make a payment for goods or services.
      #
      # The request includes the following settings:
      # - **type** - Indicates whether the link can be used only once or if it can be used multiple times.
      # - **authType** - Indicates whether the transaction is a sale or a pre-authorization.
      # - **paymentMethod** - Indicates the payment methods that the merchant accepts.
      # - **charge** - Indicates whether the merchant or the customer enters the amount for the transaction.
      #
      # If your request is successful, our gateway returns a paymentLinkId, which you can use to perform follow-on
      # actions.
      #
      # **Note:** To share the payment link with a customer, use our [Share Payment
      # Link](https://docs.payroc.com/api/schema/payment-links/sharing-events/share) method.
      #
      # @param request_options [Hash]
      # @param params [Payroc::PaymentLinks::Types::CreatePaymentLinksRequestBody]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :processing_terminal_id
      # @option params [String] :idempotency_key
      #
      # @return [Payroc::PaymentLinks::Types::CreatePaymentLinksResponse]
      def create(request_options: {}, **params)
        params = Payroc::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[processing_terminal_id]
        body_params = params.except(*path_param_names)

        headers = {}
        headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

        request = Payroc::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
          method: "POST",
          path: "processing-terminals/#{params[:processing_terminal_id]}/payment-links",
          headers: headers,
          body: Payroc::PaymentLinks::Types::CreatePaymentLinksRequestBody.new(body_params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Payroc::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Payroc::PaymentLinks::Types::CreatePaymentLinksResponse.load(response.body)
        else
          error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Use this method to retrieve information about a payment link.
      #
      # To retrieve a payment link, you need its paymentLinkId. Our gateway returned the paymentLinkId in the response
      # of the [Create Payment Link](https://docs.payroc.com/api/schema/payment-links/create) method.
      #
      # **Note:** If you don't have the paymentLinkId, use our [List Payment
      # Links](https://docs.payroc.com/api/schema/payment-links/list) method to search for the payment link.
      #
      # Our gateway returns the following information about the payment link:
      # - **type** - Indicates whether the link can be used only once or if it can be used multiple times.
      # - **authType** - Indicates whether the transaction is a sale or a pre-authorization.
      # - **paymentMethods** - Indicates the payment method that the merchant accepts.
      # - **charge** - Indicates whether the merchant or the customer enters the amount for the transaction.
      # - **status** - Indicates if the payment link is active.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :payment_link_id
      #
      # @return [Payroc::PaymentLinks::Types::RetrievePaymentLinksResponse]
      def retrieve(request_options: {}, **params)
        params = Payroc::Internal::Types::Utils.normalize_keys(params)
        request = Payroc::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
          method: "GET",
          path: "payment-links/#{params[:payment_link_id]}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Payroc::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Payroc::PaymentLinks::Types::RetrievePaymentLinksResponse.load(response.body)
        else
          error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Use this method to partially update a payment link. Structure your request to follow the [RFC
      # 6902](https://datatracker.ietf.org/doc/html/rfc6902) standard.
      #
      # To update a payment link, you need its paymentLinkId, which we sent you in the response of the [Create Payment
      # Link](https://docs.payroc.com/api/schema/payment-links/create) method.
      #
      # **Note:** If you don't have the paymentLinkId, use our [List Payment
      # Links](https://docs.payroc.com/api/schema/payment-links/list) method to search for the payment link.
      #
      # You can update the following properties of a multi-use link:
      # - **expiresOn parameter** - Expiration date of the link.
      # - **customLabels object** - Label for the payment button.
      # - **credentialOnFile object** - Settings for saving the customer's payment details.
      #
      # You can update the following properties of a single-use link:
      # - **expiresOn parameter** - Expiration date of the link.
      # - **authType parameter** - Transaction type of the payment link.
      # - **amount parameter** - Total amount of the transaction.
      # - **currency parameter** - Currency of the transaction.
      # - **description parameter** - Brief description of the transaction.
      # - **customLabels object** - Label for the payment button.
      # - **credentialOnFile object** - Settings for saving the customer's payment details.
      #
      # **Note:** When a merchant updates a single-use link, we update the payment URL and HTML code in the assets
      # object. The customer can't use the original link to make a payment.
      #
      # @param request_options [Hash]
      # @param params [Payroc::Types::PatchRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :payment_link_id
      # @option params [String] :idempotency_key
      #
      # @return [Payroc::PaymentLinks::Types::PartiallyUpdatePaymentLinksResponse]
      def partially_update(request_options: {}, **params)
        params = Payroc::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[payment_link_id]
        body_params = params.except(*path_param_names)

        headers = {}
        headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

        request = Payroc::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
          method: "PATCH",
          path: "payment-links/#{params[:payment_link_id]}",
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
          Payroc::PaymentLinks::Types::PartiallyUpdatePaymentLinksResponse.load(response.body)
        else
          error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Use this method to deactivate a payment link.
      #
      # To deactivate a payment link, you need its paymentLinkId. Our gateway returned the paymentLinkId in the response
      # of the [Create Payment Link](https://docs.payroc.com/api/schema/payment-links/create) method.
      #
      # **Note:** If you don't have the paymentLinkId, use our [List Payment
      # Links](https://docs.payroc.com/api/schema/payment-links/list) method to search for the payment link.
      #
      # If your request is successful, our gateway deactivates the payment link. The customer can't use the link to make
      # a payment, and you can't reactivate the payment link.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :payment_link_id
      #
      # @return [Payroc::PaymentLinks::Types::DeactivatePaymentLinksResponse]
      def deactivate(request_options: {}, **params)
        params = Payroc::Internal::Types::Utils.normalize_keys(params)
        request = Payroc::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
          method: "POST",
          path: "payment-links/#{params[:payment_link_id]}/deactivate",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Payroc::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Payroc::PaymentLinks::Types::DeactivatePaymentLinksResponse.load(response.body)
        else
          error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @return [Payroc::SharingEvents::Client]
      def sharing_events
        @sharing_events ||= Payroc::PaymentLinks::SharingEvents::Client.new(client: @client, base_url: @base_url, environment: @environment)
      end
    end
  end
end
