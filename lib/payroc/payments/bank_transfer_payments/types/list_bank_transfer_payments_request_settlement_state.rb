# frozen_string_literal: true

module Payroc
  module Payments
    module BankTransferPayments
      module Types
        module ListBankTransferPaymentsRequestSettlementState
          extend Payroc::Internal::Types::Enum

          SETTLED = "settled"
          UNSETTLED = "unsettled"
        end
      end
    end
  end
end
