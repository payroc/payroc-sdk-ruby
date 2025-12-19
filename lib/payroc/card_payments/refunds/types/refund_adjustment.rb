# frozen_string_literal: true

module Payroc
  module CardPayments
    module Refunds
      module Types
        class RefundAdjustment < Internal::Types::Model
          field :refund_id, -> { String }, optional: false, nullable: false, api_name: "refundId"
          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
          field :operator, -> { String }, optional: true, nullable: false
          field :adjustments, -> { Internal::Types::Array[Payroc::CardPayments::Refunds::Types::RefundAdjustmentAdjustmentsItem] }, optional: false, nullable: false
        end
      end
    end
  end
end
