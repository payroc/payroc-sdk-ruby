# frozen_string_literal: true

module Payroc
  module BankTransferPayments
    module Refunds
      module Types
        class ReverseRefundRefundsRequest < Internal::Types::Model
          field :refund_id, -> { String }, optional: false, nullable: false, api_name: "refundId"
          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
        end
      end
    end
  end
end
