# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the partially-encrypted card data for keyed transactions.
    class PartiallyEncryptedKeyedDataFormat < Internal::Types::Model
      field :device, -> { Payroc::Types::EncryptionCapableDevice }, optional: false, nullable: false
      field :encrypted_pan, -> { String }, optional: false, nullable: false, api_name: "encryptedPan"
      field :masked_pan, -> { String }, optional: false, nullable: false, api_name: "maskedPan"
      field :expiry_date, -> { String }, optional: false, nullable: false, api_name: "expiryDate"
      field :cvv, -> { String }, optional: true, nullable: false
      field :cvv_encrypted, -> { String }, optional: true, nullable: false, api_name: "cvvEncrypted"
      field :issue_number, -> { String }, optional: true, nullable: false, api_name: "issueNumber"
    end
  end
end
