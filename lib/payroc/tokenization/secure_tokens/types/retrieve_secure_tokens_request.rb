# frozen_string_literal: true

module Payroc
  module Tokenization
    module SecureTokens
      module Types
        class RetrieveSecureTokensRequest < Internal::Types::Model
          field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
          field :secure_token_id, -> { String }, optional: false, nullable: false, api_name: "secureTokenId"
        end
      end
    end
  end
end
