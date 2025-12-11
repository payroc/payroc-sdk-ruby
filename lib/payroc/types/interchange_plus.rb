# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about Interchange Plus.
    class InterchangePlus < Internal::Types::Model
      field :fees, -> { Payroc::Types::InterchangePlusFees }, optional: false, nullable: false
    end
  end
end
