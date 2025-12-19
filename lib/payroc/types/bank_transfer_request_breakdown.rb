# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the transaction.
    class BankTransferRequestBreakdown < Internal::Types::Model
      field :taxes, -> { Internal::Types::Array[Payroc::Types::TaxRate] }, optional: true, nullable: false
    end
  end
end
