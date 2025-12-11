# frozen_string_literal: true

module Payroc
  module Types
    class SwipedCardDetailsSwipedData < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :data_format

      member -> { Payroc::Types::EncryptedSwipedDataFormat }, key: "ENCRYPTED"
      member -> { Payroc::Types::PlainTextSwipedDataFormat }, key: "PLAIN_TEXT"
    end
  end
end
