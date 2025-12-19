# frozen_string_literal: true

module Payroc
  module Types
    module EventSubscriptionStatus
      extend Payroc::Internal::Types::Enum

      REGISTERED = "registered"
      SUSPENDED = "suspended"
      FAILED = "failed"
    end
  end
end
