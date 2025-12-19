# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about saving the customer’s payment details.
    class CredentialOnFile < Internal::Types::Model
      field :tokenize, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :mit_agreement, -> { Payroc::Types::CredentialOnFileMitAgreement }, optional: true, nullable: false, api_name: "mitAgreement"
    end
  end
end
