# frozen_string_literal: true

module Payroc
  module Funding
    module FundingInstructions
      module Types
        class ListFundingInstructionsRequest < Internal::Types::Model
          field :before, -> { String }, optional: true, nullable: false
          field :after, -> { String }, optional: true, nullable: false
          field :limit, -> { Integer }, optional: true, nullable: false
          field :date_from, -> { String }, optional: false, nullable: false, api_name: "dateFrom"
          field :date_to, -> { String }, optional: false, nullable: false, api_name: "dateTo"
        end
      end
    end
  end
end
