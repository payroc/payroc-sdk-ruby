# frozen_string_literal: true

module Payroc
  module Types
    module DualPricingAlternativeTender
      extend Payroc::Internal::Types::Enum

      CARD = "card"
      CASH = "cash"
      BANK_TRANSFER = "bankTransfer"
    end
  end
end
