# frozen_string_literal: true

module Payroc
  module Types
    module PaymentSummaryStatus
      extend Payroc::Internal::Types::Enum

      READY = "ready"
      PENDING = "pending"
      DECLINED = "declined"
      COMPLETE = "complete"
      REFERRAL = "referral"
      PICKUP = "pickup"
      REVERSAL = "reversal"
      RETURNED = "returned"
      ADMIN = "admin"
      EXPIRED = "expired"
      ACCEPTED = "accepted"
    end
  end
end
