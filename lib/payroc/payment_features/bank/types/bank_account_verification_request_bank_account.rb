# frozen_string_literal: true

module Payroc
  module PaymentFeatures
    module Bank
      module Types
        # Object that contains information about the bank account.
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
