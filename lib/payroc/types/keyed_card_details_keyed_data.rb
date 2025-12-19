# frozen_string_literal: true

module Payroc
  module Types
    class KeyedCardDetailsKeyedData < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :data_format

      member -> { Payroc::Types::FullyEncryptedKeyedDataFormat }, key: "FULLY_ENCRYPTED"
      member -> { Payroc::Types::PartiallyEncryptedKeyedDataFormat }, key: "PARTIALLY_ENCRYPTED"
      member -> { Payroc::Types::PlainTextKeyedDataFormat }, key: "PLAIN_TEXT"
    end
  end
end
