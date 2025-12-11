# frozen_string_literal: true

module Payroc
  module Payments
    module BankTransferPayments
      module Types
        class RetrieveBankTransferPaymentsRequest < Internal::Types::Model
          field :payment_id, -> { String }, optional: false, nullable: false, api_name: "paymentId"
        end
      end
    end
  end
end
