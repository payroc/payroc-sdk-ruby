# frozen_string_literal: true

module Payroc
  module PayrocCloud
    module SignatureInstructions
      module Types
        class SignatureInstructionRequest < Internal::Types::Model
          field :serial_number, -> { String }, optional: false, nullable: false, api_name: "serialNumber"
          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
          field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
        end
      end
    end
  end
end
