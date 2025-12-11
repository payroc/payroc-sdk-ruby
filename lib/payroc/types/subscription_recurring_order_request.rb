# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the cost of each payment.
    # **Note:** Send this object only if the value for **type** is `automatic`.
    class SubscriptionRecurringOrderRequest < Internal::Types::Model
      field :breakdown, -> { Payroc::Types::SubscriptionOrderBreakdownRequest }, optional: true, nullable: false
    end
  end
end
