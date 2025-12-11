# frozen_string_literal: true

module Payroc
  module Payments
    module BankTransferRefunds
      module Types
        module ListBankTransferRefundsRequestSettlementState
          extend Payroc::Internal::Types::Enum

          SETTLED = "settled"
          UNSETTLED = "unsettled"
        end
      end
    end
  end
end
