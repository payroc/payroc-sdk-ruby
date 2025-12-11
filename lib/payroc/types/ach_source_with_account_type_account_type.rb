# frozen_string_literal: true

module Payroc
  module Types
    module AchSourceWithAccountTypeAccountType
      extend Payroc::Internal::Types::Enum

      CHECKING = "checking"
      SAVINGS = "savings"
    end
  end
end
