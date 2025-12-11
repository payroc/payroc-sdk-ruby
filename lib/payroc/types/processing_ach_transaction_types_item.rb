# frozen_string_literal: true

module Payroc
  module Types
    module ProcessingAchTransactionTypesItem
      extend Payroc::Internal::Types::Enum

      PREARRANGED_PAYMENT = "prearrangedPayment"
      CORP_CASH_DISBURSEMENT = "corpCashDisbursement"
      TELEPHONE_INITIATED_PAYMENT = "telephoneInitiatedPayment"
      WEB_INITIATED_PAYMENT = "webInitiatedPayment"
      OTHER = "other"
    end
  end
end
