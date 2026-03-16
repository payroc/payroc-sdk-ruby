# frozen_string_literal: true

module Payroc
  module Types
    class PricingAgreement < Internal::Types::Model
      field :country, -> { Payroc::Types::PricingAgreementCountry }, optional: true, nullable: false
      field :version, -> { Payroc::Types::PricingAgreementVersion }, optional: true, nullable: false
      field :base, -> { Payroc::Types::BaseUs }, optional: true, nullable: false
      field :processor, -> { Payroc::Types::PricingAgreementProcessor }, optional: true, nullable: false
      field :gateway, -> { Payroc::Types::GatewayUs52 }, optional: true, nullable: false
      field :services, -> { Internal::Types::Array[Payroc::Types::ServiceUs50] }, optional: true, nullable: false
    end
  end
end
