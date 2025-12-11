# frozen_string_literal: true

module Payroc
  module Types
    class SubscriptionPaymentOrder < Internal::Types::Model
      field :breakdown, -> { Payroc::Types::SubscriptionOrderBreakdown }, optional: true, nullable: false
    end
  end
end
