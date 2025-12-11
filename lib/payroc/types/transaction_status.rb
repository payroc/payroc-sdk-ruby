# frozen_string_literal: true

module Payroc
  module Types
    module TransactionStatus
      extend Payroc::Internal::Types::Enum

      FULL_SUSPENSE = "fullSuspense"
      HELD_AUDITED = "heldAudited"
      HELD_RELEASED_AUDITED = "heldReleasedAudited"
      HOLD_FOR_SETTLEMENT_30_DAYS = "holdForSettlement30Days"
      HOLD_FOR_SETTLEMENT_DUPLICATE = "holdForSettlementDuplicate"
      HOLD_LONG_TERM = "holdLongTerm"
      PAID = "paid"
      PAID_BY_THIRD_PARTY = "paidByThirdParty"
      PARTIAL_RELEASE = "partialRelease"
      PULL = "pull"
      RELEASE = "release"
      NEW = "new"
      HELD = "held"
      UNKNOWN = "unknown"
    end
  end
end
