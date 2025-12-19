# frozen_string_literal: true

module Payroc
  module CardPayments
    module Refunds
      module Types
        class ReferencedRefund < Internal::Types::Model
          field :payment_id, -> { String }, optional: false, nullable: false, api_name: "paymentId"
          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
          field :operator, -> { String }, optional: true, nullable: false
          field :amount, -> { Integer }, optional: false, nullable: false
          field :description, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
