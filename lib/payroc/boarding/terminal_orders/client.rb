# frozen_string_literal: true

module Payroc
  module Boarding
    module TerminalOrders
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

        # Use this method to retrieve information about a terminal order.
        #
        # To retrieve a terminal order, you need it's terminalOrderId. Our gateway returned the terminalOrderId in the
        # response of the [Create Terminal
        # Order](https://docs.payroc.com/api/schema/boarding/processing-accounts/create-terminal-order) method.
        #
        # **Note**: If you don't have the terminalOrderId, use our [List Terminal
        # Orders](https://docs.payroc.com/api/schema/boarding/processing-accounts/list-terminal-orders) method to search
        # for the terminal order.
        #
        # Our gateway returns the following information about the terminal order:
        # - Status of the order
        # - Items in the order
        # - Training provider
        # - Shipping information
        #
        # **Note**: You can subscribe to our terminalOrder.status.changed event to get notifications when we update the
        # status of a terminal order. For more information about how to subscribe to events, go to [Events
        # Subscriptions](https://docs.payroc.com/guides/integrate/event-subscriptions).
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :terminal_order_id
        #
        # @return [Payroc::Types::TerminalOrder]
        def retrieve(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "GET",
            path: "terminal-orders/#{params[:terminal_order_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::TerminalOrder.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
