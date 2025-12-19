# frozen_string_literal: true

module Payroc
  module Types
    module ProcessingTerminalStatus
      extend Payroc::Internal::Types::Enum

      ACTIVE = "active"
      INACTIVE = "inactive"
    end
  end
end
