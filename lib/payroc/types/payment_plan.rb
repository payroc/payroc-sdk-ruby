# frozen_string_literal: true

module Payroc
  module Types
    class PaymentPlan < Internal::Types::Model
      field :setup_order, -> { Payroc::Types::PaymentPlanSetupOrder }, optional: true, nullable: false, api_name: "setupOrder"
      field :recurring_order, -> { Payroc::Types::PaymentPlanRecurringOrder }, optional: true, nullable: false, api_name: "recurringOrder"
    end
  end
end
