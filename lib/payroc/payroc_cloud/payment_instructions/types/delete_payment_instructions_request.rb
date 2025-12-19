# frozen_string_literal: true

module Payroc
  module PayrocCloud
    module PaymentInstructions
      module Types
        class DeletePaymentInstructionsRequest < Internal::Types::Model
          field :payment_instruction_id, -> { String }, optional: false, nullable: false, api_name: "paymentInstructionId"
        end
      end
    end
  end
end
