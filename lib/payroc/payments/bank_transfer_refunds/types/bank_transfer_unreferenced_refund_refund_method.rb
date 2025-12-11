# frozen_string_literal: true

module Payroc
  module Payments
    module BankTransferRefunds
      module Types
        # Object that contains information about how the merchant refunds the customer.
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
