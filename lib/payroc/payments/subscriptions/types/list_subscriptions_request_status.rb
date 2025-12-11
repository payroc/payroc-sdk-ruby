# frozen_string_literal: true

module Payroc
  module Payments
    module Subscriptions
      module Types
        module ListSubscriptionsRequestStatus
          extend Payroc::Internal::Types::Enum

          ACTIVE = "active"
          COMPLETED = "completed"
          SUSPENDED = "suspended"
          CANCELLED = "cancelled"
        end
      end
    end
  end
end
