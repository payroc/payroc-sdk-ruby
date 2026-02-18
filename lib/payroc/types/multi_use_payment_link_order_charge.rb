# frozen_string_literal: true

module Payroc
  module Types
    # Polymorphic object that indicates who enters the amount for the payment link.
    #
    # The value of the type parameter determines which variant you should use:
    # -	`prompt` - Customer enters the amount.
    # -	`preset` - Merchant sets the amount.
    class MultiUsePaymentLinkOrderCharge < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :type

      member -> { Payroc::Types::PromptPaymentLinkCharge }, key: "PROMPT"
      member -> { Payroc::Types::PresetPaymentLinkCharge }, key: "PRESET"
    end
  end
end
