# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the payment.
    class PaymentInstructionOrder < Internal::Types::Model
      field :breakdown, -> { Payroc::Types::BreakdownForPaymentInstructions }, optional: true, nullable: false
    end
  end
end
