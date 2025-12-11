# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about U.S. base fees.
    class BaseUs < Internal::Types::Model
      field :address_verification, -> { Integer }, optional: true, nullable: false, api_name: "addressVerification"
      field :annual_fee, -> { Payroc::Types::BaseUsAnnualFee }, optional: false, nullable: false, api_name: "annualFee"
      field :regulatory_assistance_program, -> { Integer }, optional: true, nullable: false, api_name: "regulatoryAssistanceProgram"
      field :pci_non_compliance, -> { Integer }, optional: true, nullable: false, api_name: "pciNonCompliance"
      field :merchant_advantage, -> { Integer }, optional: true, nullable: false, api_name: "merchantAdvantage"
      field :platinum_security, -> { Payroc::Types::BaseUsPlatinumSecurity }, optional: true, nullable: false, api_name: "platinumSecurity"
      field :maintenance, -> { Integer }, optional: false, nullable: false
      field :minimum, -> { Integer }, optional: false, nullable: false
      field :voice_authorization, -> { Integer }, optional: true, nullable: false, api_name: "voiceAuthorization"
      field :chargeback, -> { Integer }, optional: true, nullable: false
      field :retrieval, -> { Integer }, optional: true, nullable: false
      field :batch, -> { Integer }, optional: false, nullable: false
      field :early_termination, -> { Integer }, optional: true, nullable: false, api_name: "earlyTermination"
    end
  end
end
