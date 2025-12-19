# frozen_string_literal: true

module Payroc
  module BankTransferPayments
    module Payments
      module Types
        module ListPaymentsRequestTypeItem
          extend Payroc::Internal::Types::Enum

          PAYMENT = "payment"
          ACCOUNT_VERIFICATION = "accountVerification"
        end
      end
    end
  end
end
