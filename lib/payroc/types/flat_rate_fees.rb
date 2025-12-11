# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the Flat Rate fees.
    class FlatRateFees < Internal::Types::Model
      field :standard_cards, -> { Payroc::Types::ProcessorFee }, optional: false, nullable: false, api_name: "standardCards"
      field :amex, -> { Payroc::Types::FlatRateFeesAmex }, optional: true, nullable: false
      field :pin_debit, -> { Payroc::Types::PinDebit }, optional: true, nullable: false, api_name: "pinDebit"
      field :electronic_benefits_transfer, -> { Payroc::Types::ElectronicBenefitsTransfer }, optional: true, nullable: false, api_name: "electronicBenefitsTransfer"
      field :speciality_cards, -> { Payroc::Types::SpecialityCards }, optional: true, nullable: false, api_name: "specialityCards"
    end
  end
end
