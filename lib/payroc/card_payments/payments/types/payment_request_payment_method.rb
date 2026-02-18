# frozen_string_literal: true

module Payroc
  module CardPayments
    module Payments
      module Types
        # Polymorphic object that contains payment details.
        #
        # The value of the type parameter determines which variant you should use:
        # -	`card` - Payment card details
        # -	`secureToken` - Secure token details
        # -	`digitalWallet` - Digital wallet details
        # -	`singleUseToken` - Single-use token details
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
