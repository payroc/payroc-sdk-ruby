# frozen_string_literal: true

module Payroc
  module Types
    module DisputeStatusStatus
      extend Payroc::Internal::Types::Enum

      PREARBITRATION_IN_PROCESS = "prearbitrationInProcess"
      PREARBITRATION_ACCEPTED = "prearbitrationAccepted"
      PREARBITRATION_DECLINED = "prearbitrationDeclined"
      ARBITRATION_FILED_WITH_CARD_BAND = "arbitrationFiledWithCardBand"
      ARBITRATION_FUNDS_TO_BE_RETURNED = "arbitrationFundsToBeReturned"
      ARBITRATION_LOST = "arbitrationLost"
      ARBITRATION_SETTLED_PARTIAL_AMOUNT = "arbitrationSettledPartialAmount"
      PRECOMPLIANCE_IN_PROCESS = "precomplianceInProcess"
      PRECOMPLIANCE_ACCEPTED = "precomplianceAccepted"
      PRECOMPLIANCE_DECLINED = "precomplianceDeclined"
      COMPLIANCE_FILED_WITH_CARD_BAND = "complianceFiledWithCardBand"
      COMPLIANCE_LOST = "complianceLost"
      COMPLIANCE_SETTLED_PARTIAL_AMOUNT = "complianceSettledPartialAmount"
      INVALID = "invalid"
      ISSUER_REVERSAL = "issuerReversal"
      NEW = "new"
      REJECTED = "rejected"
      REPRESENTMENT_IN_PROGRESS = "representmentInProgress"
      REPRESENTMENT_FAILED = "representmentFailed"
      REPRESENTMENT_PAID = "representmentPaid"
      REPRESENTMENT_RECEIVED = "representmentReceived"
      STAND = "stand"
    end
  end
end
