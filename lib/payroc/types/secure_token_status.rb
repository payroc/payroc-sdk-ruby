# frozen_string_literal: true

module Payroc
  module Types
    module SecureTokenStatus
      extend Payroc::Internal::Types::Enum

      NOT_VALIDATED = "notValidated"
      CVV_VALIDATED = "cvvValidated"
      VALIDATION_FAILED = "validationFailed"
      ISSUE_NUMBER_VALIDATED = "issueNumberValidated"
      CARD_NUMBER_VALIDATED = "cardNumberValidated"
      BANK_ACCOUNT_VALIDATED = "bankAccountValidated"
    end
  end
end
