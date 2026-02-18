# frozen_string_literal: true

module Payroc
  module Types
    # Polymorphic object that contains bank account information.
    #
    # The value of the type field determines which variant you should use:
    # -	`ach` - Automated Clearing House (ACH) details
    # -	`pad` - Pre-authorized debit (PAD) details
    class BankTransferRefundBankAccount < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :type

      member -> { Payroc::Types::AchBankAccount }, key: "ACH"
      member -> { Payroc::Types::PadBankAccount }, key: "PAD"
    end
  end
end
