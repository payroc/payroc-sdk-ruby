# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about tiered pricing with three tiers.
    class Tiered3 < Internal::Types::Model
      field :fees, -> { Payroc::Types::Tiered3Fees }, optional: false, nullable: false
    end
  end
end
