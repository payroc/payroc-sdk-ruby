# frozen_string_literal: true

module Payroc
  module Types
    # Polymorphic object that contains payment card details.
    class SingleUseTokenPaymentMethod < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :type

      member -> { Payroc::Types::CardPayload }, key: "CARD"
    end
  end
end
