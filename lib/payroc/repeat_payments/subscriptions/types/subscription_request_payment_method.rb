# frozen_string_literal: true

module Payroc
  module RepeatPayments
    module Subscriptions
      module Types
        # Polymorphic object that contains information about the secure token.
        class SubscriptionRequestPaymentMethod < Internal::Types::Model
          extend Payroc::Internal::Types::Union

          discriminant :type

          member -> { Payroc::Types::SecureTokenPayload }, key: "SECURE_TOKEN"
        end
      end
    end
  end
end
