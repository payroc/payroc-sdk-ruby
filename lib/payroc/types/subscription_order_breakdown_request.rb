# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the taxes to apply to the transaction.
    class SubscriptionOrderBreakdownRequest < Internal::Types::Model
      field :taxes, -> { Internal::Types::Array[Payroc::Types::TaxRate] }, optional: true, nullable: false
    end
  end
end
