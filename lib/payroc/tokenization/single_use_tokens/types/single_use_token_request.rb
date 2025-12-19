# frozen_string_literal: true

module Payroc
  module Tokenization
    module SingleUseTokens
      module Types
        class SingleUseTokenRequest < Internal::Types::Model
          field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
          field :channel, -> { Payroc::Tokenization::SingleUseTokens::Types::SingleUseTokenRequestChannel }, optional: false, nullable: false
          field :operator, -> { String }, optional: true, nullable: false
          field :source, -> { Payroc::Tokenization::SingleUseTokens::Types::SingleUseTokenRequestSource }, optional: false, nullable: false
        end
      end
    end
  end
end
