# frozen_string_literal: true

module Payroc
  module PaymentLinks
    module Types
      module ListPaymentLinksRequestChargeType
        extend Payroc::Internal::Types::Enum

        PRESET = "preset"
        PROMPT = "prompt"
      end
    end
  end
end
