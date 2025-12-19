# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the payment details in the customer’s digital wallet.
    class DigitalWalletPayload < Internal::Types::Model
      field :account_type, -> { Payroc::Types::DigitalWalletPayloadAccountType }, optional: true, nullable: false, api_name: "accountType"
      field :service_provider, -> { Payroc::Types::DigitalWalletPayloadServiceProvider }, optional: false, nullable: false, api_name: "serviceProvider"
      field :cardholder_name, -> { String }, optional: true, nullable: false, api_name: "cardholderName"
      field :encrypted_data, -> { String }, optional: false, nullable: false, api_name: "encryptedData"
    end
  end
end
