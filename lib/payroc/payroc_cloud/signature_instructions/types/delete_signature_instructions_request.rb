# frozen_string_literal: true

module Payroc
  module PayrocCloud
    module SignatureInstructions
      module Types
        class DeleteSignatureInstructionsRequest < Internal::Types::Model
          field :signature_instruction_id, -> { String }, optional: false, nullable: false, api_name: "signatureInstructionId"
        end
      end
    end
  end
end
