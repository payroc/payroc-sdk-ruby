# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the payment.
    class PaymentOrderRequest < Internal::Types::Model
      field :breakdown, -> { Payroc::Types::ItemizedBreakdownRequest }, optional: true, nullable: false
    end
  end
end
