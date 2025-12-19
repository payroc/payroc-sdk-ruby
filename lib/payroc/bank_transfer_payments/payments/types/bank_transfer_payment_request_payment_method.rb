# frozen_string_literal: true

module Payroc
  module BankTransferPayments
    module Payments
      module Types
        # Object that contains information about the customer's payment details.
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
