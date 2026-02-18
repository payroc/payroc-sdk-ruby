# frozen_string_literal: true

module Payroc
  module Types
    # Polymorphic object that contains payment card details that the merchant manually entered into the device.
    #
    # The value of the dataFormat parameter determines which variant you should use:
    # -	`fullyEncrypted` - Some payment card details are encrypted.
    # -	`partiallyEncrypted` - Payment card details are in plain text.
    # -	`plainText` - All payment card details are encrypted.
    class KeyedCardDetailsKeyedData < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :data_format

      member -> { Payroc::Types::FullyEncryptedKeyedDataFormat }, key: "FULLY_ENCRYPTED"
      member -> { Payroc::Types::PartiallyEncryptedKeyedDataFormat }, key: "PARTIALLY_ENCRYPTED"
      member -> { Payroc::Types::PlainTextKeyedDataFormat }, key: "PLAIN_TEXT"
    end
  end
end
