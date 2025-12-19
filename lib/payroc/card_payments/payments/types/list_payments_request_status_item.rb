# frozen_string_literal: true

module Payroc
  module CardPayments
    module Payments
      module Types
        module ListPaymentsRequestStatusItem
          extend Payroc::Internal::Types::Enum

          READY = "ready"
          PENDING = "pending"
          DECLINED = "declined"
          COMPLETE = "complete"
          REFERRAL = "referral"
          PICKUP = "pickup"
          REVERSAL = "reversal"
          ADMIN = "admin"
          EXPIRED = "expired"
          ACCEPTED = "accepted"
        end
      end
    end
  end
end
