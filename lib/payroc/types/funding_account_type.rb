# frozen_string_literal: true

module Payroc
  module Types
    module FundingAccountType
      extend Payroc::Internal::Types::Enum

      CHECKING = "checking"
      SAVINGS = "savings"
      GENERAL_LEDGER = "generalLedger"
    end
  end
end
