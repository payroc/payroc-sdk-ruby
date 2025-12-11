# frozen_string_literal: true

module Payroc
  module Types
    class PaymentInstruction < Internal::Types::Model
      field :payment_instruction_id, -> { String }, optional: true, nullable: false, api_name: "paymentInstructionId"
    end
  end
end
