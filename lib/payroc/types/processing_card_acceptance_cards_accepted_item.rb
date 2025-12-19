# frozen_string_literal: true

module Payroc
  module Types
    module ProcessingCardAcceptanceCardsAcceptedItem
      extend Payroc::Internal::Types::Enum

      VISA = "visa"
      MASTERCARD = "mastercard"
      DISCOVER = "discover"
      AMEX_OPT_BLUE = "amexOptBlue"
    end
  end
end
