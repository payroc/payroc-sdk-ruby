# frozen_string_literal: true

module Payroc
  module Types
    module RewardPayChoiceFeesDebitOption
      extend Payroc::Internal::Types::Enum

      INTERCHANGE_PLUS = "interchangePlus"
      FLAT_RATE = "flatRate"
    end
  end
end
