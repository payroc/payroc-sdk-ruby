# frozen_string_literal: true

module Payroc
  module Payments
    module BankTransferRefunds
      module Types
        class ReverseBankTransferRefundsRequest < Internal::Types::Model
          field :refund_id, -> { String }, optional: false, nullable: false, api_name: "refundId"
          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
        end
      end
    end
  end
end
