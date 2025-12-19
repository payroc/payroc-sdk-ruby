# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the types of cards that the processing account accepts.
    class ProcessingCardAcceptance < Internal::Types::Model
      field :debit_only, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "debitOnly"
      field :hsa_fsa, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "hsaFsa"
      field :cards_accepted, -> { Internal::Types::Array[Payroc::Types::ProcessingCardAcceptanceCardsAcceptedItem] }, optional: true, nullable: false, api_name: "cardsAccepted"
      field :speciality_cards, -> { Payroc::Types::ProcessingCardAcceptanceSpecialityCards }, optional: true, nullable: false, api_name: "specialityCards"
    end
  end
end
