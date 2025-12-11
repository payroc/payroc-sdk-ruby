# frozen_string_literal: true

module Payroc
  module Types
    module AchPayloadAccountType
      extend Payroc::Internal::Types::Enum

      CHECKING = "checking"
      SAVINGS = "savings"
    end
  end
end
