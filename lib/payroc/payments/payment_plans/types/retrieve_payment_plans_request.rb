# frozen_string_literal: true

module Payroc
  module Payments
    module PaymentPlans
      module Types
        class RetrievePaymentPlansRequest < Internal::Types::Model
          field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
          field :payment_plan_id, -> { String }, optional: false, nullable: false, api_name: "paymentPlanId"
        end
      end
    end
  end
end
