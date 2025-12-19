# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the cost of each payment.
    class SubscriptionRecurringOrder < Internal::Types::Model
      field :breakdown, -> { Payroc::Types::SubscriptionOrderBreakdown }, optional: true, nullable: false
    end
  end
end
