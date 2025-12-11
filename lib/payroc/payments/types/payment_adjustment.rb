# frozen_string_literal: true

module Payroc
  module Payments
    module Types
      class PaymentAdjustment < Internal::Types::Model
        field :payment_id, -> { String }, optional: false, nullable: false, api_name: "paymentId"
        field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
        field :operator, -> { String }, optional: true, nullable: false
        field :adjustments, -> { Internal::Types::Array[Payroc::Payments::Types::PaymentAdjustmentAdjustmentsItem] }, optional: false, nullable: false
      end
    end
  end
end
