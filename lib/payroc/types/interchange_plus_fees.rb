# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the fees.
    class InterchangePlusFees < Internal::Types::Model
      field :mastercard_visa_discover, -> { Payroc::Types::ProcessorFee }, optional: false, nullable: false, api_name: "mastercardVisaDiscover"
      field :amex, -> { Payroc::Types::InterchangePlusFeesAmex }, optional: true, nullable: false
      field :pin_debit, -> { Payroc::Types::PinDebit }, optional: true, nullable: false, api_name: "pinDebit"
      field :electronic_benefits_transfer, -> { Payroc::Types::ElectronicBenefitsTransfer }, optional: true, nullable: false, api_name: "electronicBenefitsTransfer"
      field :enhanced_interchange, -> { Payroc::Types::EnhancedInterchange }, optional: true, nullable: false, api_name: "enhancedInterchange"
      field :speciality_cards, -> { Payroc::Types::SpecialityCards }, optional: true, nullable: false, api_name: "specialityCards"
    end
  end
end
