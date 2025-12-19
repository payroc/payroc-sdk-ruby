# frozen_string_literal: true

module Payroc
  module Types
    class SignatureInstruction < Internal::Types::Model
      field :signature_instruction_id, -> { String }, optional: true, nullable: false, api_name: "signatureInstructionId"
    end
  end
end
