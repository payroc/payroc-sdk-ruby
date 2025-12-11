# frozen_string_literal: true

module Payroc
  module Types
    class PaginatedFundRecipients < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Payroc::Types::FundingRecipient] }, optional: true, nullable: false
    end
  end
end
