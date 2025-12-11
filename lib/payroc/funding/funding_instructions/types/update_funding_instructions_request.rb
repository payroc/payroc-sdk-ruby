# frozen_string_literal: true

module Payroc
  module Funding
    module FundingInstructions
      module Types
        class UpdateFundingInstructionsRequest < Internal::Types::Model
          field :instruction_id, -> { Integer }, optional: false, nullable: false, api_name: "instructionId"
          field :body, -> { Payroc::Types::Instruction }, optional: false, nullable: false
        end
      end
    end
  end
end
