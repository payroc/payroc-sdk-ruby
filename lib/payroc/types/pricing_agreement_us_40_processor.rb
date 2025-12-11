# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about U.S. processor fees.
    class PricingAgreementUs40Processor < Internal::Types::Model
      field :card, -> { Payroc::Types::PricingAgreementUs40ProcessorCard }, optional: true, nullable: false
      field :ach, -> { Payroc::Types::Ach }, optional: true, nullable: false
    end
  end
end
