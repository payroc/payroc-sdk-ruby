# frozen_string_literal: true

module Payroc
  module Funding
    module FundingInstructions
      module Types
        class CreateFundingInstructionsRequest < Internal::Types::Model
          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
          field :body, -> { Payroc::Types::Instruction }, optional: false, nullable: false
        end
      end
    end
  end
end
