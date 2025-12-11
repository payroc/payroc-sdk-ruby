# frozen_string_literal: true

module Payroc
  module Funding
    module FundingInstructions
      module Types
        class DeleteFundingInstructionsRequest < Internal::Types::Model
          field :instruction_id, -> { Integer }, optional: false, nullable: false, api_name: "instructionId"
        end
      end
    end
  end
end
