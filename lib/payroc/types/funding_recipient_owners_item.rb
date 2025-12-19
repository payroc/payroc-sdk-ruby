# frozen_string_literal: true

module Payroc
  module Types
    class FundingRecipientOwnersItem < Internal::Types::Model
      field :owner_id, -> { Integer }, optional: true, nullable: false, api_name: "ownerId"
      field :link, -> { Payroc::Types::FundingRecipientOwnersItemLink }, optional: true, nullable: false
    end
  end
end
