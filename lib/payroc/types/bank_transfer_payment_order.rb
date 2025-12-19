# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the transaction.
    class BankTransferPaymentOrder < Internal::Types::Model
      field :breakdown, -> { Payroc::Types::BankTransferBreakdown }, optional: true, nullable: false
    end
  end
end
