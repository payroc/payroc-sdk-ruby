# frozen_string_literal: true

module Payroc
  module Payments
    module BankTransferPayments
      module Types
        class ReverseBankTransferPaymentsRequest < Internal::Types::Model
          field :payment_id, -> { String }, optional: false, nullable: false, api_name: "paymentId"
          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
        end
      end
    end
  end
end
