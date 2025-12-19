# frozen_string_literal: true

module Payroc
  module PayrocCloud
    module RefundInstructions
      module Types
        class RetrieveRefundInstructionsRequest < Internal::Types::Model
          field :refund_instruction_id, -> { String }, optional: false, nullable: false, api_name: "refundInstructionId"
        end
      end
    end
  end
end
