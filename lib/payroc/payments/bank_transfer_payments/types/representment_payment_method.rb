# frozen_string_literal: true

module Payroc
  module Payments
    module BankTransferPayments
      module Types
        # Object that contains information about the customer's payment details.
        class RepresentmentPaymentMethod < Internal::Types::Model
          extend Payroc::Internal::Types::Union

          discriminant :type

          member -> { Payroc::Types::AchPayload }, key: "ACH"
          member -> { Payroc::Types::SecureTokenPayload }, key: "SECURE_TOKEN"
        end
      end
    end
  end
end
