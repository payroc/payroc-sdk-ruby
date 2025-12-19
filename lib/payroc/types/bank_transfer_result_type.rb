# frozen_string_literal: true

module Payroc
  module Types
    module BankTransferResultType
      extend Payroc::Internal::Types::Enum

      PAYMENT = "payment"
      REFUND = "refund"
      UNREFERENCED_REFUND = "unreferencedRefund"
      ACCOUNT_VERIFICATION = "accountVerification"
    end
  end
end
