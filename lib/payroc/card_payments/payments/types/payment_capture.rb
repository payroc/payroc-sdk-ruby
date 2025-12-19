# frozen_string_literal: true

module Payroc
  module CardPayments
    module Payments
      module Types
        class PaymentCapture < Internal::Types::Model
          field :payment_id, -> { String }, optional: false, nullable: false, api_name: "paymentId"
          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
          field :processing_terminal_id, -> { String }, optional: true, nullable: false, api_name: "processingTerminalId"
          field :operator, -> { String }, optional: true, nullable: false
          field :amount, -> { Integer }, optional: true, nullable: false
          field :breakdown, -> { Payroc::Types::ItemizedBreakdownRequest }, optional: true, nullable: false
        end
      end
    end
  end
end
