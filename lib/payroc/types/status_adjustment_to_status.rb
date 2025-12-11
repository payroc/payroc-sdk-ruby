# frozen_string_literal: true

module Payroc
  module Types
    module StatusAdjustmentToStatus
      extend Payroc::Internal::Types::Enum

      READY = "ready"
      PENDING = "pending"
    end
  end
end
