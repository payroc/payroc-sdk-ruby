# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about U.S. pricing intents for Merchant Processing Agreement (MPA) 5.2.
    class PricingAgreementUs52 < Internal::Types::Model
      field :country, -> { Payroc::Types::PricingAgreementUs52Country }, optional: false, nullable: false
      field :version, -> { Payroc::Types::PricingAgreementUs52Version }, optional: false, nullable: false
      field :base, -> { Payroc::Types::BaseUs }, optional: false, nullable: false
      field :processor, -> { Payroc::Types::PricingAgreementUs52Processor }, optional: true, nullable: false
      field :gateway, -> { Payroc::Types::GatewayUs52 }, optional: true, nullable: false
      field :services, -> { Internal::Types::Array[Payroc::Types::ServiceUs50] }, optional: true, nullable: false
    end
  end
end
