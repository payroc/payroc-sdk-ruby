# frozen_string_literal: true

module Payroc
  module Types
    module InstructionMerchantsItemRecipientsItemStatus
      extend Payroc::Internal::Types::Enum

      ACCEPTED = "accepted"
      PENDING = "pending"
      RELEASED = "released"
      FUNDED = "funded"
      FAILED = "failed"
      REJECTED = "rejected"
      ON_HOLD = "onHold"
    end
  end
end
