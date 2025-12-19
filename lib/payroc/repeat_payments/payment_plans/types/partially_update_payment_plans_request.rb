# frozen_string_literal: true

module Payroc
  module RepeatPayments
    module PaymentPlans
      module Types
        class PartiallyUpdatePaymentPlansRequest < Internal::Types::Model
          field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
          field :payment_plan_id, -> { String }, optional: false, nullable: false, api_name: "paymentPlanId"
          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
          field :body, -> { Internal::Types::Array[Payroc::Types::PatchDocument] }, optional: false, nullable: false
        end
      end
    end
  end
end
