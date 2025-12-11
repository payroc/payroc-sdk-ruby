# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the dynamic currency conversion (DCC) offer.
    #
    # For more information about DCC, go to [Dynamic Currency
    # Conversion](https://docs.payroc.com/knowledge/card-payments/dynamic-currency-conversion).
    class DccOffer < Internal::Types::Model
      field :accepted, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :offer_reference, -> { String }, optional: true, nullable: false, api_name: "offerReference"
      field :fx_amount, -> { Integer }, optional: false, nullable: false, api_name: "fxAmount"
      field :fx_currency, -> { Payroc::Types::Currency }, optional: false, nullable: false, api_name: "fxCurrency"
      field :fx_currency_code, -> { String }, optional: true, nullable: false, api_name: "fxCurrencyCode"
      field :fx_currency_exponent, -> { Integer }, optional: true, nullable: false, api_name: "fxCurrencyExponent"
      field :fx_rate, -> { Integer }, optional: false, nullable: false, api_name: "fxRate"
      field :markup, -> { Integer }, optional: false, nullable: false
      field :markup_text, -> { String }, optional: true, nullable: false, api_name: "markupText"
      field :provider, -> { String }, optional: true, nullable: false
      field :source, -> { String }, optional: true, nullable: false
    end
  end
end
