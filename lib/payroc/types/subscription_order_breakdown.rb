# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the surcharge and taxes that apply to the transaction.
    class SubscriptionOrderBreakdown < Internal::Types::Model
      field :surcharge, -> { Payroc::Types::Surcharge }, optional: true, nullable: false
      field :taxes, -> { Internal::Types::Array[Payroc::Types::RetrievedTax] }, optional: true, nullable: false
    end
  end
end
