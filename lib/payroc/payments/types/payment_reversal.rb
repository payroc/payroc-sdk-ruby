# frozen_string_literal: true

module Payroc
  module Payments
    module Types
      class PaymentReversal < Internal::Types::Model
        field :payment_id, -> { String }, optional: false, nullable: false, api_name: "paymentId"
        field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
        field :operator, -> { String }, optional: true, nullable: false
        field :amount, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
