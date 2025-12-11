# frozen_string_literal: true

module Payroc
  module Types
    class PaymentPlanSummary < Internal::Types::Model
      field :payment_plan_id, -> { String }, optional: false, nullable: false, api_name: "paymentPlanId"
      field :name, -> { String }, optional: false, nullable: false
      field :link, -> { Payroc::Types::Link }, optional: true, nullable: false
    end
  end
end
