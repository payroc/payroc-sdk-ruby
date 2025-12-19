# frozen_string_literal: true

module Payroc
  module BankTransferPayments
    module Refunds
      module Types
        module ListRefundsRequestTypeItem
          extend Payroc::Internal::Types::Enum

          REFUND = "refund"
          UNREFERENCED_REFUND = "unreferencedRefund"
        end
      end
    end
  end
end
