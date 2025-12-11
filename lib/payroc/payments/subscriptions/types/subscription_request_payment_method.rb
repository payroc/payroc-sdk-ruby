# frozen_string_literal: true

module Payroc
  module Payments
    module Subscriptions
      module Types
        # Object that contains information about the customer's payment details.
        class SubscriptionRequestPaymentMethod < Internal::Types::Model
          extend Payroc::Internal::Types::Union

          discriminant :type

          member -> { Payroc::Types::SecureTokenPayload }, key: "SECURE_TOKEN"
        end
      end
    end
  end
end
