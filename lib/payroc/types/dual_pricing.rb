# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about dual pricing.
    class DualPricing < Internal::Types::Model
      field :offered, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :choice_rate, -> { Payroc::Types::ChoiceRate }, optional: true, nullable: false, api_name: "choiceRate"
      field :alternative_tender, -> { Payroc::Types::DualPricingAlternativeTender }, optional: true, nullable: false, api_name: "alternativeTender"
    end
  end
end
