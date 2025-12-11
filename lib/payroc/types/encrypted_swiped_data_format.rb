# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the encrypted swiped card data.
    class EncryptedSwipedDataFormat < Internal::Types::Model
      field :device, -> { Payroc::Types::EncryptionCapableDevice }, optional: false, nullable: false
      field :encrypted_data, -> { String }, optional: false, nullable: false, api_name: "encryptedData"
      field :first_digit_of_pan, -> { String }, optional: true, nullable: false, api_name: "firstDigitOfPan"
      field :fallback, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :fallback_reason, -> { Payroc::Types::EncryptedSwipedDataFormatFallbackReason }, optional: true, nullable: false, api_name: "fallbackReason"
    end
  end
end
