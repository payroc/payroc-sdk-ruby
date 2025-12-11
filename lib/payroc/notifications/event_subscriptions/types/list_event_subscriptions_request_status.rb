# frozen_string_literal: true

module Payroc
  module Notifications
    module EventSubscriptions
      module Types
        module ListEventSubscriptionsRequestStatus
          extend Payroc::Internal::Types::Enum

          REGISTERED = "registered"
          SUSPENDED = "suspended"
          FAILED = "failed"
        end
      end
    end
  end
end
