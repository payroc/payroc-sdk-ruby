# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the secure token.
    class SecureToken < Internal::Types::Model
      field :secure_token_id, -> { String }, optional: false, nullable: false, api_name: "secureTokenId"
      field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
      field :mit_agreement, -> { Payroc::Types::SecureTokenMitAgreement }, optional: true, nullable: false, api_name: "mitAgreement"
      field :customer, -> { Payroc::Types::RetrievedCustomer }, optional: true, nullable: false
      field :source, -> { Payroc::Types::SecureTokenSource }, optional: false, nullable: false
      field :token, -> { String }, optional: false, nullable: false
      field :status, -> { Payroc::Types::SecureTokenStatus }, optional: false, nullable: false
      field :custom_fields, -> { Internal::Types::Array[Payroc::Types::CustomField] }, optional: true, nullable: false, api_name: "customFields"
    end
  end
end
