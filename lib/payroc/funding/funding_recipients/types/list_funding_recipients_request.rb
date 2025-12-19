# frozen_string_literal: true

module Payroc
  module Funding
    module FundingRecipients
      module Types
        class ListFundingRecipientsRequest < Internal::Types::Model
          field :before, -> { String }, optional: true, nullable: false
          field :after, -> { String }, optional: true, nullable: false
          field :limit, -> { Integer }, optional: true, nullable: false
        end
      end
    end
  end
end
