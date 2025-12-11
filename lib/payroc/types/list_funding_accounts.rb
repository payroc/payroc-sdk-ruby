# frozen_string_literal: true

module Payroc
  module Types
    class ListFundingAccounts < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Payroc::Types::FundingAccount] }, optional: false, nullable: false
    end
  end
end
