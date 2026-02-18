# frozen_string_literal: true

module Payroc
  module PaymentFeatures
    module Cards
      module Types
        # Polymorphic object that contains payment details.
        #
        # The value of the type parameter determines which variant you should use:
        # -	`card` - Payment card details
        # -	`singleUseToken` - Single-use token details
        class BalanceInquiryCard < Internal::Types::Model
          extend Payroc::Internal::Types::Union

          discriminant :type

          member -> { Payroc::Types::CardPayload }, key: "CARD"
          member -> { Payroc::Types::SingleUseTokenPayload }, key: "SINGLE_USE_TOKEN"
        end
      end
    end
  end
end
