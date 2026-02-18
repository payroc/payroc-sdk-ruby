# frozen_string_literal: true

module Payroc
  module Types
    # Polymorphic object that contains the payment method that we tokenized.
    #
    # The value of the type parameter determines which variant you should use:
    # -	`ach` - Automated Clearing House (ACH) details
    # -	`pad` - Pre-authorized debit (PAD) details
    # -	`card` - Payment card details
    class SingleUseTokenSource < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :type

      member -> { Payroc::Types::AchSource }, key: "ACH"
      member -> { Payroc::Types::PadSource }, key: "PAD"
      member -> { Payroc::Types::CardSource }, key: "CARD"
    end
  end
end
