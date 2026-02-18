# frozen_string_literal: true

module Payroc
  module PaymentFeatures
    module Cards
      module Types
        # Polymorphic object that contains payment details.
        #
        # The value of the type parameter determines which variant you should use:
        # -	`card` - Payment card details
        # -	`secureToken` - Secure token details
        # -	`digitalWallet` - Digital wallet details
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
