# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the transaction.
    class BankTransferBreakdown < Internal::Types::Model
      field :taxes, -> { Internal::Types::Array[Payroc::Types::RetrievedTax] }, optional: true, nullable: false
    end
  end
end
