# frozen_string_literal: true

module Payroc
  module Types
    class RefundInstruction < Internal::Types::Model
      field :refund_instruction_id, -> { String }, optional: true, nullable: false, api_name: "refundInstructionId"
    end
  end
end
