# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about U.S. processor fees.
    class PricingAgreementUs50Processor < Internal::Types::Model
      field :card, -> { Payroc::Types::PricingAgreementUs50ProcessorCard }, optional: true, nullable: false
      field :ach, -> { Payroc::Types::Ach }, optional: true, nullable: false
    end
  end
end
