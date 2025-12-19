# frozen_string_literal: true

module Payroc
  module Types
    module SingleUsePaymentLinkStatus
      extend Payroc::Internal::Types::Enum

      ACTIVE = "active"
      COMPLETED = "completed"
      DEACTIVATED = "deactivated"
      EXPIRED = "expired"
    end
  end
end
