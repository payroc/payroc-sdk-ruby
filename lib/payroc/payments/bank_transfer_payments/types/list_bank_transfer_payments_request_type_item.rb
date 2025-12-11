# frozen_string_literal: true

module Payroc
  module Payments
    module BankTransferPayments
      module Types
        module ListBankTransferPaymentsRequestTypeItem
          extend Payroc::Internal::Types::Enum

          PAYMENT = "payment"
          ACCOUNT_VERIFICATION = "accountVerification"
        end
      end
    end
  end
end
