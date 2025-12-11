# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the transaction.
    class BankTransferBreakdownBase < Internal::Types::Model
      field :subtotal, -> { Integer }, optional: false, nullable: false
      field :tip, -> { Payroc::Types::Tip }, optional: true, nullable: false
    end
  end
end
