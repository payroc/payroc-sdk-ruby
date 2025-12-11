# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the total funds available in the card.
    class CardBalance < Internal::Types::Model
      field :benefit_category, -> { Payroc::Types::CardBalanceBenefitCategory }, optional: false, nullable: false, api_name: "benefitCategory"
      field :amount, -> { Integer }, optional: false, nullable: false
      field :currency, -> { Payroc::Types::Currency }, optional: false, nullable: false
    end
  end
end
