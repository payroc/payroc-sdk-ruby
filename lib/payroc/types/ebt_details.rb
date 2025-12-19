# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the Electronic Benefit Transfer (EBT) transaction.
    class EbtDetails < Internal::Types::Model
      field :benefit_category, -> { Payroc::Types::EbtDetailsBenefitCategory }, optional: false, nullable: false, api_name: "benefitCategory"
      field :withdrawal, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
