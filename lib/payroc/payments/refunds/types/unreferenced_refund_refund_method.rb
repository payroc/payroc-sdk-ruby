# frozen_string_literal: true

module Payroc
  module Payments
    module Refunds
      module Types
        # Object that contains information about how the merchant refunds the customer.
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
