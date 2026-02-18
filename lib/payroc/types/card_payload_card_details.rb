# frozen_string_literal: true

module Payroc
  module Types
    # Polymorphic object that contains payment card information.
    #
    # The value of the entryMethod parameter determines which variant you should use:
    # - `raw` - Unencrypted payment data directly from the device.
    # - `icc` - Payment data that the device captured from the chip.
    # - `keyed` - Payment data that the merchant entered manually.
    # - `swiped` - Payment data that the device captured from the magnetic strip.
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
