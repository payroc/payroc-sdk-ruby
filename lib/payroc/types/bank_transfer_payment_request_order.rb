# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the transaction.
    class BankTransferPaymentRequestOrder < Internal::Types::Model
      field :breakdown, -> { Payroc::Types::BankTransferRequestBreakdown }, optional: true, nullable: false
    end
  end
end
