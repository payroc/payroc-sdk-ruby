# frozen_string_literal: true

module Payroc
  module Payments
    module SecureTokens
      module Types
        class TokenizationRequest < Internal::Types::Model
          field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
          field :secure_token_id, -> { String }, optional: true, nullable: false, api_name: "secureTokenId"
          field :operator, -> { String }, optional: true, nullable: false
          field :mit_agreement, -> { Payroc::Payments::SecureTokens::Types::TokenizationRequestMitAgreement }, optional: true, nullable: false, api_name: "mitAgreement"
          field :customer, -> { Payroc::Types::Customer }, optional: true, nullable: false
          field :ip_address, -> { Payroc::Types::IpAddress }, optional: true, nullable: false, api_name: "ipAddress"
          field :source, -> { Payroc::Payments::SecureTokens::Types::TokenizationRequestSource }, optional: false, nullable: false
          field :three_d_secure, -> { Payroc::Payments::SecureTokens::Types::TokenizationRequestThreeDSecure }, optional: true, nullable: false, api_name: "threeDSecure"
          field :custom_fields, -> { Internal::Types::Array[Payroc::Types::CustomField] }, optional: true, nullable: false, api_name: "customFields"
        end
      end
    end
  end
end
