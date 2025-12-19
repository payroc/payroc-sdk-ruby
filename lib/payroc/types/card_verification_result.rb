# frozen_string_literal: true

module Payroc
  module Types
    class CardVerificationResult < Internal::Types::Model
      field :operator, -> { String }, optional: true, nullable: false
      field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
      field :card, -> { Payroc::Types::Card }, optional: true, nullable: false
      field :verified, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :transaction_result, -> { Payroc::Types::TransactionResult }, optional: true, nullable: false, api_name: "transactionResult"
    end
  end
end
