# frozen_string_literal: true

module Payroc
  module Funding
    module FundingInstructions
      module Types
        class ListFundingInstructionsResponse < Internal::Types::Model
          field :data, -> { Internal::Types::Array[Payroc::Funding::FundingInstructions::Types::ListFundingInstructionsResponseDataItem] }, optional: false, nullable: false
        end
      end
    end
  end
end
