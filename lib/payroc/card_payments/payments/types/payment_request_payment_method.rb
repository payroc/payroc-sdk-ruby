# frozen_string_literal: true

module Payroc
  module CardPayments
    module Payments
      module Types
        # Object that contains information about the customer's payment details.
        class PaymentRequestPaymentMethod < Internal::Types::Model
          extend Payroc::Internal::Types::Union

          discriminant :type

          member -> { Payroc::Types::CardPayload }, key: "CARD"
          member -> { Payroc::Types::SecureTokenPayload }, key: "SECURE_TOKEN"
          member -> { Payroc::Types::DigitalWalletPayload }, key: "DIGITAL_WALLET"
          member -> { Payroc::Types::SingleUseTokenPayload }, key: "SINGLE_USE_TOKEN"
        end
      end
    end
  end
end
