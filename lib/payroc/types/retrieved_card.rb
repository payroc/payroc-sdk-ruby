# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the details of the payment card.
    class RetrievedCard < Internal::Types::Model
      field :type, -> { String }, optional: false, nullable: false
      field :entry_method, -> { Payroc::Types::RetrievedCardEntryMethod }, optional: true, nullable: false, api_name: "entryMethod"
      field :cardholder_name, -> { String }, optional: true, nullable: false, api_name: "cardholderName"
      field :cardholder_signature, -> { String }, optional: true, nullable: false, api_name: "cardholderSignature"
      field :card_number, -> { String }, optional: false, nullable: false, api_name: "cardNumber"
      field :expiry_date, -> { String }, optional: false, nullable: false, api_name: "expiryDate"
      field :secure_token, -> { Payroc::Types::SecureTokenSummary }, optional: true, nullable: false, api_name: "secureToken"
      field :security_checks, -> { Payroc::Types::SecurityCheck }, optional: true, nullable: false, api_name: "securityChecks"
      field :emv_tags, -> { Internal::Types::Array[Payroc::Types::EmvTag] }, optional: true, nullable: false, api_name: "emvTags"
      field :balances, -> { Internal::Types::Array[Payroc::Types::CardBalance] }, optional: true, nullable: false
    end
  end
end
