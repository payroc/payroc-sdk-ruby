# frozen_string_literal: true

module Payroc
  module Payments
    module CurrencyConversion
      module Types
        # Object that contains information about the customer's payment details.
        class FxRateInquiryPaymentMethod < Internal::Types::Model
          extend Payroc::Internal::Types::Union

          discriminant :type

          member -> { Payroc::Types::CardPayload }, key: "CARD"
          member -> { Payroc::Types::SecureTokenPayload }, key: "SECURE_TOKEN"
          member -> { Payroc::Types::DigitalWalletPayload }, key: "DIGITAL_WALLET"
        end
      end
    end
  end
end
