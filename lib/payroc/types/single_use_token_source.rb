# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the payment method that we tokenized.
    class SingleUseTokenSource < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :type

      member -> { Payroc::Types::AchSource }, key: "ACH"
      member -> { Payroc::Types::PadSource }, key: "PAD"
      member -> { Payroc::Types::CardSource }, key: "CARD"
    end
  end
end
