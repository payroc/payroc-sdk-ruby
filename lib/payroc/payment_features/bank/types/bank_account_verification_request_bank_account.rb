# frozen_string_literal: true

module Payroc
  module PaymentFeatures
    module Bank
      module Types
        # Polymorphic object that contains bank account information.
        #
        # The value of the type field determines which variant you should use:
        # -	`ach` - Automated Clearing House (ACH) details
        # -	`pad` - Pre-authorized debit (PAD) details
        class BankAccountVerificationRequestBankAccount < Internal::Types::Model
          extend Payroc::Internal::Types::Union

          discriminant :type

          member -> { Payroc::Types::AchPayload }, key: "ACH"
          member -> { Payroc::Types::PadPayload }, key: "PAD"
        end
      end
    end
  end
end
