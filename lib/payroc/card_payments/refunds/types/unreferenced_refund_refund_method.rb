# frozen_string_literal: true

module Payroc
  module CardPayments
    module Refunds
      module Types
        # Polymorphic object that contains information about the payment method that the merchant uses to refund the
        # customer.
        #
        # The value of the type parameter determines which variant you should use:
        # -	`card` - Payment card details
        # -	`secureToken` - Secure token details
        class UnreferencedRefundRefundMethod < Internal::Types::Model
          extend Payroc::Internal::Types::Union

          discriminant :type

          member -> { Payroc::Types::CardPayload }, key: "CARD"
          member -> { Payroc::Types::SecureTokenPayload }, key: "SECURE_TOKEN"
        end
      end
    end
  end
end
