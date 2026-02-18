# frozen_string_literal: true

module Payroc
  module Tokenization
    module SingleUseTokens
      module Types
        # Polymorphic object that contains the payment method to tokenize.
        #
        # The value of the type parameter determines which variant you should use:
        # -	`ach` - Automated Clearing House (ACH) details
        # -	`pad` - Pre-authorized debit (PAD) details
        # -	`card` - Payment card details
        class SingleUseTokenRequestSource < Internal::Types::Model
          extend Payroc::Internal::Types::Union

          discriminant :type

          member -> { Payroc::Types::AchPayload }, key: "ACH"
          member -> { Payroc::Types::PadPayload }, key: "PAD"
          member -> { Payroc::Types::CardPayload }, key: "CARD"
        end
      end
    end
  end
end
