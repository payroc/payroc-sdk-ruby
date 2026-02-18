# frozen_string_literal: true

module Payroc
  module BankTransferPayments
    module Payments
      module Types
        # Polymorphic object that contains payment detail information.
        #
        # The value of the type parameter determines which variant you should use:
        # -	`ach` - Automated Clearing House (ACH) details
        # -	`pad` - Pre-authorized debit (PAD) details
        # -	`secureToken` - Secure token details
        # -	`singleUseToken` - Single-use token details
        class BankTransferPaymentRequestPaymentMethod < Internal::Types::Model
          extend Payroc::Internal::Types::Union

          discriminant :type

          member -> { Payroc::Types::AchPayload }, key: "ACH"
          member -> { Payroc::Types::PadPayload }, key: "PAD"
          member -> { Payroc::Types::SecureTokenPayload }, key: "SECURE_TOKEN"
          member -> { Payroc::Types::SingleUseTokenPayload }, key: "SINGLE_USE_TOKEN"
        end
      end
    end
  end
end
