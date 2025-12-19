# frozen_string_literal: true

module Payroc
  module Types
    module CommonFundingFundingSchedule
      extend Payroc::Internal::Types::Enum

      STANDARD = "standard"
      NEXTDAY = "nextday"
      SAMEDAY = "sameday"
    end
  end
end
