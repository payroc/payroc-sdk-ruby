# frozen_string_literal: true

module Payroc
  module Types
    module TipType
      extend Payroc::Internal::Types::Enum

      PERCENTAGE = "percentage"
      FIXED_AMOUNT = "fixedAmount"
    end
  end
end
