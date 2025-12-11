# frozen_string_literal: true

module Payroc
  module Payments
    module SecureTokens
      module Types
        class UpdateAccountSecureTokensRequest < Internal::Types::Model
          field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
          field :secure_token_id, -> { String }, optional: false, nullable: false, api_name: "secureTokenId"
          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
          field :body, -> { Payroc::Types::AccountUpdate }, optional: false, nullable: false
        end
      end
    end
  end
end
