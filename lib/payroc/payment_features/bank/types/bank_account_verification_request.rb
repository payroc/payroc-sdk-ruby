# frozen_string_literal: true

module Payroc
  module PaymentFeatures
    module Bank
      module Types
        class BankAccountVerificationRequest < Internal::Types::Model
          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
          field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
          field :bank_account, -> { Payroc::PaymentFeatures::Bank::Types::BankAccountVerificationRequestBankAccount }, optional: false, nullable: false, api_name: "bankAccount"
        end
      end
    end
  end
end
