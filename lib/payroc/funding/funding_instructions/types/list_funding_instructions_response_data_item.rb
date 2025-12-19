# frozen_string_literal: true

module Payroc
  module Funding
    module FundingInstructions
      module Types
        class ListFundingInstructionsResponseDataItem < Internal::Types::Model
          field :link, -> { Payroc::Types::Link }, optional: true, nullable: false
        end
      end
    end
  end
end
