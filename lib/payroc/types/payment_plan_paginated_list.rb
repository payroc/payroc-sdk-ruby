# frozen_string_literal: true

module Payroc
  module Types
    class PaymentPlanPaginatedList < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Payroc::Types::PaymentPlan] }, optional: false, nullable: false
    end
  end
end
