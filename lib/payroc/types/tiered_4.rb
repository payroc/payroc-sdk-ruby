# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about tiered pricing with four tiers.
    class Tiered4 < Internal::Types::Model
      field :fees, -> { Payroc::Types::Tiered4Fees }, optional: false, nullable: false
    end
  end
end
