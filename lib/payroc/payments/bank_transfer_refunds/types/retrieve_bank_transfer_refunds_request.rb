# frozen_string_literal: true

module Payroc
  module Payments
    module BankTransferRefunds
      module Types
        class RetrieveBankTransferRefundsRequest < Internal::Types::Model
          field :refund_id, -> { String }, optional: false, nullable: false, api_name: "refundId"
        end
      end
    end
  end
end
