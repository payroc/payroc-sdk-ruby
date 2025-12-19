# frozen_string_literal: true

module Payroc
  module Types
    module CommonFundingStatus
      extend Payroc::Internal::Types::Enum

      ENABLED = "enabled"
      DISABLED = "disabled"
    end
  end
end
