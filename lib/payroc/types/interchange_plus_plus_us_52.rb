# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about Interchange Plus Plus.
    class InterchangePlusPlusUs52 < Internal::Types::Model
      field :fees, -> { Payroc::Types::InterchangePlusPlusUs52Fees }, optional: false, nullable: false
    end
  end
end
