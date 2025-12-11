# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about U.S. pricing intents for Merchant Processing Agreement (MPA) 4.0.
    class PricingAgreementUs40 < Internal::Types::Model
      field :country, -> { Payroc::Types::PricingAgreementUs40Country }, optional: false, nullable: false
      field :version, -> { Payroc::Types::PricingAgreementUs40Version }, optional: false, nullable: false
      field :base, -> { Payroc::Types::BaseUs }, optional: false, nullable: false
      field :processor, -> { Payroc::Types::PricingAgreementUs40Processor }, optional: true, nullable: false
      field :gateway, -> { Payroc::Types::GatewayUs }, optional: true, nullable: false
    end
  end
end
