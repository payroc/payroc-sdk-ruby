# frozen_string_literal: true

module Payroc
  module BankTransferPayments
    module Refunds
      module Types
        class RetrieveRefundsRequest < Internal::Types::Model
          field :refund_id, -> { String }, optional: false, nullable: false, api_name: "refundId"
        end
      end
    end
  end
end
