# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the fees.
    class Tiered4Fees < Internal::Types::Model
      field :mastercard_visa_discover, -> { Payroc::Types::QualRatesWithPremium }, optional: false, nullable: false, api_name: "mastercardVisaDiscover"
      field :amex, -> { Payroc::Types::Tiered4FeesAmex }, optional: true, nullable: false
      field :pin_debit, -> { Payroc::Types::PinDebit }, optional: true, nullable: false, api_name: "pinDebit"
      field :electronic_benefits_transfer, -> { Payroc::Types::ElectronicBenefitsTransfer }, optional: true, nullable: false, api_name: "electronicBenefitsTransfer"
      field :speciality_cards, -> { Payroc::Types::SpecialityCards }, optional: true, nullable: false, api_name: "specialityCards"
    end
  end
end
