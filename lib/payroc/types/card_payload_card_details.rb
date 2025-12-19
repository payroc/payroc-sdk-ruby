# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the details of the payment card.
    class CardPayloadCardDetails < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :entry_method

      member -> { Payroc::Types::RawCardDetails }, key: "RAW"
      member -> { Payroc::Types::IccCardDetails }, key: "ICC"
      member -> { Payroc::Types::KeyedCardDetails }, key: "KEYED"
      member -> { Payroc::Types::SwipedCardDetails }, key: "SWIPED"
    end
  end
end
