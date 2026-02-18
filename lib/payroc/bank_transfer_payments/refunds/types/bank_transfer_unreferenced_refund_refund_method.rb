# frozen_string_literal: true

module Payroc
  module BankTransferPayments
    module Refunds
      module Types
        # Polymorphic object that contains payment details for the refund.
        #
        # The value of the type parameter determines which variant you should use:
        # -	`ach` - Automated Clearing House (ACH) details
        # -	`secureToken` - Secure token details
        class BankTransferUnreferencedRefundRefundMethod < Internal::Types::Model
          extend Payroc::Internal::Types::Union

          discriminant :type

          member -> { Payroc::Types::AchPayload }, key: "ACH"
          member -> { Payroc::Types::SecureTokenPayload }, key: "SECURE_TOKEN"
        end
      end
    end
  end
end
