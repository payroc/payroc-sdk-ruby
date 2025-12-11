# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the bank account.
    class BankTransferPaymentBankAccount < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :type

      member -> { Payroc::Types::AchBankAccount }, key: "ACH"
      member -> { Payroc::Types::PadBankAccount }, key: "PAD"
    end
  end
end
