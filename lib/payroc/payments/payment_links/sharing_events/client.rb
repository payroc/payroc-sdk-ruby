# frozen_string_literal: true

module Payroc
  module Payments
    module PaymentLinks
      module SharingEvents
        class Client
          # @param client [Payroc::Internal::Http::RawClient]
          #
          # @return [void]
          def initialize(client:)
            @client = client
          end

          # Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of sharing events for a
          # payment link. A sharing event occurs when a merchant shares a payment link with a customer.
          #
          # To list the sharing events for a payment link, you need its paymentLinkId. Our gateway returned the
          # paymentLinkId in the response of the [Create Payment
          # Link](https://docs.payroc.com/api/schema/payments/payment-links/create) method.
          #
          # **Note:** If you don't have the paymentLinkId, use our [List Payment
          # Links](https://docs.payroc.com/api/schema/payments/payment-links/list) method to search for the payment
          # link.
          #
          # Use query parameters to filter the list of results that we return, for example, to search for links sent to
          # a specific customer.
          #
          # Our gateway returns the following information for each sharing event in the list:
          # - Customer that the merchant sent the link to.
          # - Date that the merchant sent the link.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String] :payment_link_id
          # @option params [String, nil] :recipient_name
          # @option params [String, nil] :recipient_email
          # @option params [String, nil] :before
          # @option params [String, nil] :after
          # @option params [Integer, nil] :limit
          #
          # @return [Payroc::Types::SharingEventPaginatedList]
          def list(request_options: {}, **params)
            params = Payroc::Internal::Types::Utils.symbolize_keys(params)
            query_param_names = %i[recipient_name recipient_email before after limit]
            query_params = {}
            query_params["recipientName"] = params[:recipient_name] if params.key?(:recipient_name)
            query_params["recipientEmail"] = params[:recipient_email] if params.key?(:recipient_email)
            query_params["before"] = params[:before] if params.key?(:before)
            query_params["after"] = params[:after] if params.key?(:after)
            query_params["limit"] = params[:limit] if params.key?(:limit)
            params = params.except(*query_param_names)

            request = Payroc::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
              method: "GET",
              path: "payment-links/#{params[:payment_link_id]}/sharing-events",
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
              parsed_response = Payroc::Types::SharingEventPaginatedList.load(response.body)
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

          # Use this method to email a payment link to a customer.
          #
          # To email a payment link, you need its paymentLinkId. Our gateway returned the paymentLinkId in the response
          # of the [Create Payment Link](https://docs.payroc.com/api/schema/payments/payment-links/create) method.
          #
          # **Note:** If you don't have the paymentLinkId, use our [List Payment
          # Links](https://docs.payroc.com/api/schema/payments/payment-links/list) method to search for the payment
          # link.
          #
          # In the request, you must provide the recipient's name and email address.
          #
          # In the response, our gateway returns a sharingEventId, which you can use to [List Payment Link Sharing
          # Events](https://docs.payroc.com/api/schema/payments/payment-links/sharing-events/list).
          #
          # @param request_options [Hash]
          # @param params [Payroc::Types::PaymentLinkEmailShareEvent]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String] :payment_link_id
          # @option params [String] :idempotency_key
          #
          # @return [Payroc::Types::PaymentLinkEmailShareEvent]
          def share(request_options: {}, **params)
            path_param_names = %i[payment_link_id]
            body_params = params.except(*path_param_names)

            request = Payroc::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
              method: "POST",
              path: "payment-links/#{params[:payment_link_id]}/sharing-events",
              body: Payroc::Types::PaymentLinkEmailShareEvent.new(body_params).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Payroc::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Payroc::Types::PaymentLinkEmailShareEvent.load(response.body)
            else
              error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end
        end
      end
    end
  end
end
