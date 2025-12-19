# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the encrypted card data for keyed transactions.
    class FullyEncryptedKeyedDataFormat < Internal::Types::Model
      field :device, -> { Payroc::Types::EncryptionCapableDevice }, optional: false, nullable: false
      field :encrypted_data, -> { String }, optional: false, nullable: false, api_name: "encryptedData"
      field :first_digit_of_pan, -> { String }, optional: true, nullable: false, api_name: "firstDigitOfPan"
    end
  end
end
