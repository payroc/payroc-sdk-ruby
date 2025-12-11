# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the adjustment to the transaction. Send this object if the merchant is
    # adjusting the order details.
    class OrderAdjustment < Internal::Types::Model
      field :amount, -> { Integer }, optional: false, nullable: false
      field :breakdown, -> { Payroc::Types::BreakdownAdjustment }, optional: true, nullable: false
    end
  end
end
