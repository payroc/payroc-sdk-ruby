# frozen_string_literal: true

module Payroc
  module Payments
    module BankTransferPayments
      module Types
        module ListBankTransferPaymentsRequestStatusItem
          extend Payroc::Internal::Types::Enum

          READY = "ready"
          PENDING = "pending"
          DECLINED = "declined"
          COMPLETE = "complete"
          ADMIN = "admin"
          REVERSAL = "reversal"
          RETURNED = "returned"
        end
      end
    end
  end
end
