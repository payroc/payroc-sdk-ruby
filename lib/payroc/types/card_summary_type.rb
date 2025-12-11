# frozen_string_literal: true

module Payroc
  module Types
    module CardSummaryType
      extend Payroc::Internal::Types::Enum

      VISA = "visa"
      MASTER_CARD = "masterCard"
      DISCOVER = "discover"
      DEBIT = "debit"
      EBT = "ebt"
      WRIGHT_EXPRESS = "wrightExpress"
      VOYAGER = "voyager"
      AMEX = "amex"
      PRIVATE_LABEL = "privateLabel"
      STORED_VALUE = "storedValue"
      DISCOVER_RETAINED = "discoverRetained"
      JCB_NON_SETTLED = "jcbNonSettled"
      DINERS_CLUB = "dinersClub"
      AMEX_OPT_BLUE = "amexOptBlue"
      FUELMAN = "fuelman"
      UNKNOWN = "unknown"
    end
  end
end
