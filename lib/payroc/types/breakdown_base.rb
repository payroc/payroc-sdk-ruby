# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the breakdown of the transaction.
    class BreakdownBase < Internal::Types::Model
      field :subtotal, -> { Integer }, optional: false, nullable: false
      field :cashback_amount, -> { Integer }, optional: true, nullable: false, api_name: "cashbackAmount"
      field :tip, -> { Payroc::Types::Tip }, optional: true, nullable: false
      field :surcharge, -> { Payroc::Types::Surcharge }, optional: true, nullable: false
      field :dual_pricing, -> { Payroc::Types::DualPricing }, optional: true, nullable: false, api_name: "dualPricing"
    end
  end
end
