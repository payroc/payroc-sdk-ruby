# frozen_string_literal: true

module Payroc
  module Types
    # Object that indicates if the merchant accepts American Express Direct cards and contains the merchant’s American
    # Express merchant number.
    class ProcessingCardAcceptanceSpecialityCardsAmericanExpressDirect < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :merchant_number, -> { String }, optional: true, nullable: false, api_name: "merchantNumber"
    end
  end
end
