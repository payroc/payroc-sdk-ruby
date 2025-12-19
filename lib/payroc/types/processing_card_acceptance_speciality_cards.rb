# frozen_string_literal: true

module Payroc
  module Types
    # Information about the speciality cards that the merchant accepts.
    class ProcessingCardAcceptanceSpecialityCards < Internal::Types::Model
      field :american_express_direct, -> { Payroc::Types::ProcessingCardAcceptanceSpecialityCardsAmericanExpressDirect }, optional: true, nullable: false, api_name: "americanExpressDirect"
      field :electronic_benefits_transfer, -> { Payroc::Types::ProcessingCardAcceptanceSpecialityCardsElectronicBenefitsTransfer }, optional: true, nullable: false, api_name: "electronicBenefitsTransfer"
      field :other, -> { Payroc::Types::ProcessingCardAcceptanceSpecialityCardsOther }, optional: true, nullable: false
    end
  end
end
