# frozen_string_literal: true

module Payroc
  module Payments
    module Cards
      module Types
        class CardVerificationRequest < Internal::Types::Model
          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
          field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
          field :operator, -> { String }, optional: true, nullable: false
          field :customer, -> { Payroc::Types::Customer }, optional: true, nullable: false
          field :card, -> { Payroc::Payments::Cards::Types::CardVerificationRequestCard }, optional: false, nullable: false
        end
      end
    end
  end
end
