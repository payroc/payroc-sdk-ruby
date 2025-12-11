# frozen_string_literal: true

module Payroc
  module Types
    # Object that indicates if the merchant accepts Electronic Benefits Transfer (EBT) cards and contains the merchant’s
    # Food and Nutrition Services (FNS) number.
    class ProcessingCardAcceptanceSpecialityCardsElectronicBenefitsTransfer < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :fns_number, -> { String }, optional: true, nullable: false, api_name: "fnsNumber"
    end
  end
end
