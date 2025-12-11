# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about U.S. pricing intents for Merchant Processing Agreement (MPA) 5.0.
    class PricingAgreementUs50 < Internal::Types::Model
      field :country, -> { Payroc::Types::PricingAgreementUs50Country }, optional: false, nullable: false
      field :version, -> { Payroc::Types::PricingAgreementUs50Version }, optional: false, nullable: false
      field :base, -> { Payroc::Types::BaseUs }, optional: false, nullable: false
      field :processor, -> { Payroc::Types::PricingAgreementUs50Processor }, optional: true, nullable: false
      field :gateway, -> { Payroc::Types::GatewayUs50 }, optional: true, nullable: false
      field :services, -> { Internal::Types::Array[Payroc::Types::ServiceUs50] }, optional: true, nullable: false
    end
  end
end
