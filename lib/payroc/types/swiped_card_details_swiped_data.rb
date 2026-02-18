# frozen_string_literal: true

module Payroc
  module Types
    # Polymorphic object that contains payment card details that a device captured from the magnetic strip.
    #
    # The value of the dataFormat parameter determines which variant you should use:
    # -	`encrypted` - Payment card details are encrypted.
    # -	`plainText` - Payment card details are in plain text.
    class SwipedCardDetailsSwipedData < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :data_format

      member -> { Payroc::Types::EncryptedSwipedDataFormat }, key: "ENCRYPTED"
      member -> { Payroc::Types::PlainTextSwipedDataFormat }, key: "PLAIN_TEXT"
    end
  end
end
