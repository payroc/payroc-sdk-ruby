# frozen_string_literal: true

module Payroc
  module Types
    module BaseIntentStatus
      extend Payroc::Internal::Types::Enum

      ACTIVE = "active"
      PENDING_REVIEW = "pendingReview"
      REJECTED = "rejected"
    end
  end
end
