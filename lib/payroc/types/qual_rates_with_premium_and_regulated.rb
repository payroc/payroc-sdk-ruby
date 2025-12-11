# frozen_string_literal: true

module Payroc
  module Types
    class QualRatesWithPremiumAndRegulated < Internal::Types::Model
      field :regulated_check_card, -> { Payroc::Types::ProcessorFee }, optional: false, nullable: false, api_name: "regulatedCheckCard"
      field :unregulated_check_card, -> { Payroc::Types::ProcessorFee }, optional: false, nullable: false, api_name: "unregulatedCheckCard"
    end
  end
end
