# frozen_string_literal: true

module Payroc
  module Types
    class PaymentPlanRecurringOrder < Internal::Types::Model
      field :breakdown, -> { Payroc::Types::PaymentPlanOrderBreakdown }, optional: true, nullable: false
    end
  end
end
