# frozen_string_literal: true

module Payroc
  module Types
    module FundingAccountUse
      extend Payroc::Internal::Types::Enum

      CREDIT = "credit"
      DEBIT = "debit"
      CREDIT_AND_DEBIT = "creditAndDebit"
    end
  end
end
