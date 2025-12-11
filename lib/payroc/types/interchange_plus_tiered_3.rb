# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about Interchange Plus with three tiers.
    class InterchangePlusTiered3 < Internal::Types::Model
      field :fees, -> { Payroc::Types::InterchangePlusTiered3Fees }, optional: false, nullable: false
    end
  end
end
