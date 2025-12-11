# frozen_string_literal: true

module Payroc
  module Payments
    module BankTransferRefunds
      module Types
        module ListBankTransferRefundsRequestTypeItem
          extend Payroc::Internal::Types::Enum

          REFUND = "refund"
          UNREFERENCED_REFUND = "unreferencedRefund"
        end
      end
    end
  end
end
