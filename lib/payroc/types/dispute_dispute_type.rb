# frozen_string_literal: true

module Payroc
  module Types
    module DisputeDisputeType
      extend Payroc::Internal::Types::Enum

      PREARBITRATION = "prearbitration"
      ISSUER_REVERSAL = "issuerReversal"
      FIRST_DISPUTE_WITH_REVERSAL = "firstDisputeWithReversal"
      FIRST_DISPUTE = "firstDispute"
    end
  end
end
