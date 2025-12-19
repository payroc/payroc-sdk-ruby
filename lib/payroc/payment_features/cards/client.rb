# frozen_string_literal: true

module Payroc
  module PaymentFeatures
    module Cards
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

        # Use this method to verify a customer’s card details.
        #
        # In the request, send the customer’s card details.
        #
        # In the response, our gateway indicates if the card details are valid and if you should use them in follow-on
        # actions.
        #
        # @param request_options [Hash]
        # @param params [Payroc::PaymentFeatures::Cards::Types::CardVerificationRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :idempotency_key
        #
        # @return [Payroc::Types::CardVerificationResult]
        def verify_card(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          body_prop_names = %i[processing_terminal_id operator customer card]
          body_bag = params.slice(*body_prop_names)

          headers = {}
          headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "POST",
            path: "cards/verify",
            headers: headers,
            body: Payroc::PaymentFeatures::Cards::Types::CardVerificationRequest.new(body_bag).to_h,
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
        # @param params [Payroc::PaymentFeatures::Cards::Types::BalanceInquiry]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Payroc::Types::Balance]
        def view_ebt_balance(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          body_prop_names = %i[processing_terminal_id operator currency customer card]
          body_bag = params.slice(*body_prop_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "POST",
            path: "cards/balance",
            body: Payroc::PaymentFeatures::Cards::Types::BalanceInquiry.new(body_bag).to_h,
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
        # @param params [Payroc::PaymentFeatures::Cards::Types::BinLookup]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Payroc::Types::CardInfo]
        def lookup_bin(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          body_prop_names = %i[processing_terminal_id amount currency card]
          body_bag = params.slice(*body_prop_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "POST",
            path: "cards/bin-lookup",
            body: Payroc::PaymentFeatures::Cards::Types::BinLookup.new(body_bag).to_h,
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

        # > **Important:** There are restrictions on which merchants can use this method. For more information, go to
        # [Dynamic Currency Conversion](https://docs.payroc.com/knowledge/card-payments/dynamic-currency-conversion).
        #
        # Use this method to check if a card is eligible for Dynamic Currency Conversion (DCC) and to retrieve the
        # conversion rate for a transaction amount. DCC provides a customer with the option to use their card's currency
        # instead of the merchant's currency, for example, in Ireland, an American customer can pay in US dollars
        # instead of Euros.
        #
        # The request includes the following:
        #
        # - **Payment method** - Card information, a secure token, or digital wallet.
        # - **Transaction information** - Amount and currency of the transaction in the merchant's currency.
        #
        # If the card is eligible for DCC, our gateway returns the transaction amount in the card's currency and a
        # dccOffer object that contains information about the conversion rate. The dccOffer object contains the
        # following fields that you need when you [run a
        # sale](https://docs.payroc.com/api/schema/card-payments/payments/create) or [unreferenced
        # refund](https://docs.payroc.com/api/schema/card-payments/refunds/create-unreferenced-refund) with DCC:
        # - fxAmount
        # - fxCurrency
        # - fxRate
        # - markup
        # - accepted
        # - offerReference
        #
        # @param request_options [Hash]
        # @param params [Payroc::PaymentFeatures::Cards::Types::FxRateInquiry]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Payroc::Types::FxRate]
        def retrieve_fx_rates(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          body_prop_names = %i[channel processing_terminal_id operator base_amount base_currency payment_method]
          body_bag = params.slice(*body_prop_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "POST",
            path: "fx-rates",
            body: Payroc::PaymentFeatures::Cards::Types::FxRateInquiry.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::FxRate.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
