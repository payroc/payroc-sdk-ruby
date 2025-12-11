# frozen_string_literal: true

module Payroc
  module Types
    class SubscriptionPaymentOrderRequest < Internal::Types::Model
      field :breakdown, -> { Payroc::Types::SubscriptionOrderBreakdownRequest }, optional: true, nullable: false
    end
  end
end
