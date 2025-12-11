# frozen_string_literal: true

module Payroc
  module Types
    class QualRatesWithPremium < Internal::Types::Model
      field :premium_rate, -> { Payroc::Types::ProcessorFee }, optional: false, nullable: false, api_name: "premiumRate"
    end
  end
end
