# frozen_string_literal: true

module Payroc
  module Types
    module SingleUsePaymentLinkPaymentMethodsItem
      extend Payroc::Internal::Types::Enum

      CARD = "card"
      BANK_TRANSFER = "bankTransfer"
    end
  end
end
