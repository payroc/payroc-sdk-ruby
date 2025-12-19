# frozen_string_literal: true

module Payroc
  module RepeatPayments
    module PaymentPlans
      module Types
        class CreatePaymentPlansRequest < Internal::Types::Model
          field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
          field :body, -> { Payroc::Types::PaymentPlan }, optional: false, nullable: false
        end
      end
    end
  end
end
