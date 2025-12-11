# frozen_string_literal: true

module Payroc
  module Types
    module SupportedOperationsItem
      extend Payroc::Internal::Types::Enum

      CAPTURE = "capture"
      REFUND = "refund"
      FULLY_REVERSE = "fullyReverse"
      PARTIALLY_REVERSE = "partiallyReverse"
      INCREMENT_AUTHORIZATION = "incrementAuthorization"
      ADJUST_TIP = "adjustTip"
      ADD_SIGNATURE = "addSignature"
      SET_AS_READY = "setAsReady"
      SET_AS_PENDING = "setAsPending"
    end
  end
end
