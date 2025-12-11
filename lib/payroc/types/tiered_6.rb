# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about tiered pricing with six tiers.
    class Tiered6 < Internal::Types::Model
      field :fees, -> { Payroc::Types::Tiered6Fees }, optional: false, nullable: false
    end
  end
end
