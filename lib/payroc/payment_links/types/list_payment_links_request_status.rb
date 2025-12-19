# frozen_string_literal: true

module Payroc
  module PaymentLinks
    module Types
      module ListPaymentLinksRequestStatus
        extend Payroc::Internal::Types::Enum

        ACTIVE = "active"
        COMPLETED = "completed"
        DEACTIVATED = "deactivated"
        EXPIRED = "expired"
      end
    end
  end
end
