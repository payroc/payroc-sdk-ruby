# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about saving the customer’s payment details.
    class SchemasCredentialOnFile < Internal::Types::Model
      field :external_vault, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "externalVault"
      field :tokenize, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :secure_token_id, -> { String }, optional: true, nullable: false, api_name: "secureTokenId"
      field :mit_agreement, -> { Payroc::Types::SchemasCredentialOnFileMitAgreement }, optional: true, nullable: false, api_name: "mitAgreement"
    end
  end
end
