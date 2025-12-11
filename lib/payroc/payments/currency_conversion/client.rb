# frozen_string_literal: true

module Payroc
  module Payments
    module CurrencyConversion
      class Client
        # @param client [Payroc::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
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
        # @param params [Payroc::Payments::CurrencyConversion::Types::FxRateInquiry]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Payroc::Types::FxRate]
        def retrieve_fx_rates(request_options: {}, **params)
          body_prop_names = %i[channel processing_terminal_id operator base_amount base_currency payment_method]
          body_bag = params.slice(*body_prop_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "POST",
            path: "fx-rates",
            body: Payroc::Payments::CurrencyConversion::Types::FxRateInquiry.new(body_bag).to_h,
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
