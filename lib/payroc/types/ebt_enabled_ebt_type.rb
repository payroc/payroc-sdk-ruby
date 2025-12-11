# frozen_string_literal: true

module Payroc
  module Types
    module EbtEnabledEbtType
      extend Payroc::Internal::Types::Enum

      FOOD_STAMP = "foodStamp"
      CASH = "cash"
      BOTH = "both"
    end
  end
end
