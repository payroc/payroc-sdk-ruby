# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the payment.
    class PaymentOrder < Internal::Types::Model
      field :breakdown, -> { Payroc::Types::ItemizedBreakdown }, optional: true, nullable: false
    end
  end
end
