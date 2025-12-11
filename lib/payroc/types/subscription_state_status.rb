# frozen_string_literal: true

module Payroc
  module Types
    module SubscriptionStateStatus
      extend Payroc::Internal::Types::Enum

      ACTIVE = "active"
      COMPLETED = "completed"
      SUSPENDED = "suspended"
      CANCELLED = "cancelled"
    end
  end
end
