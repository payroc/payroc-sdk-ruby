# frozen_string_literal: true

module Payroc
  module BankTransferPayments
    module Payments
      module Types
        class RetrievePaymentsRequest < Internal::Types::Model
          field :payment_id, -> { String }, optional: false, nullable: false, api_name: "paymentId"
        end
      end
    end
  end
end
