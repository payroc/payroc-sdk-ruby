# frozen_string_literal: true

module Payroc
  module Payments
    module Cards
      class Client
        # @param client [Payroc::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Use this method to verify a customer’s card details.
        #
        # In the request, send the customer’s card details.
        #
        # In the response, our gateway indicates if the card details are valid and if you should use them in follow-on
        # actions.
        #
        # @param request_options [Hash]
        # @param params [Payroc::Payments::Cards::Types::CardVerificationRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :idempotency_key
        #
        # @return [Payroc::Types::CardVerificationResult]
        def verify(request_options: {}, **params)
          body_prop_names = %i[processing_terminal_id operator customer card]
          body_bag = params.slice(*body_prop_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "POST",
            path: "cards/verify",
            body: Payroc::Payments::Cards::Types::CardVerificationRequest.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::CardVerificationResult.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to view the balance of an Electronic Benefit Transfer (EBT) card.
        #
        # If the request is successful, our gateway returns the current balance of an EBT card.
        #
        # @param request_options [Hash]
        # @param params [Payroc::Payments::Cards::Types::BalanceInquiry]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Payroc::Types::Balance]
        def view_balance(request_options: {}, **params)
          body_prop_names = %i[processing_terminal_id operator currency customer card]
          body_bag = params.slice(*body_prop_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "POST",
            path: "cards/balance",
            body: Payroc::Payments::Cards::Types::BalanceInquiry.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::Balance.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to retrieve information about a debit card, a credit card, or an EBT card. If you apply
        # surcharges to transactions, you can also check if the card supports surcharging.
        #
        # In the response, our gateway returns the following information about the card:
        #
        # - **Card details** - Information about the card, for example, the issuing bank and the masked card number.
        #
        # - **Surcharging information** - If you apply a surcharge to transactions, our gateway checks that the card
        # supports surcharging and returns information about the surcharge. For more information about surcharging, go
        # to [Credit card surcharging](https://docs.payroc.com/knowledge/card-payments/credit-card-surcharging).
        #
        # @param request_options [Hash]
        # @param params [Payroc::Payments::Cards::Types::BinLookup]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Payroc::Types::CardInfo]
        def lookup_bin(request_options: {}, **params)
          body_prop_names = %i[processing_terminal_id amount currency card]
          body_bag = params.slice(*body_prop_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "POST",
            path: "cards/bin-lookup",
            body: Payroc::Payments::Cards::Types::BinLookup.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::CardInfo.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
