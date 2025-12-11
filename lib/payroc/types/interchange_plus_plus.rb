# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about Interchange Plus Plus.
    class InterchangePlusPlus < Internal::Types::Model
      field :fees, -> { Payroc::Types::InterchangePlusPlusFees }, optional: false, nullable: false
    end
  end
end
