# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the taxes that apply to the transaction.
    class PaymentPlanOrderBreakdownBase < Internal::Types::Model
      field :subtotal, -> { Integer }, optional: false, nullable: false
    end
  end
end
