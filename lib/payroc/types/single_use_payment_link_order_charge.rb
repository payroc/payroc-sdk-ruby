# frozen_string_literal: true

module Payroc
  module Types
    # Indicates whether the merchant or the customer enters the amount for the transaction.
    class SingleUsePaymentLinkOrderCharge < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :type

      member -> { Payroc::Types::PromptPaymentLinkCharge }, key: "PROMPT"
      member -> { Payroc::Types::PresetPaymentLinkCharge }, key: "PRESET"
    end
  end
end
