# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about Interchange Plus.
    class InterchangePlusUs52 < Internal::Types::Model
      field :fees, -> { Payroc::Types::InterchangePlusUs52Fees }, optional: false, nullable: false
    end
  end
end
