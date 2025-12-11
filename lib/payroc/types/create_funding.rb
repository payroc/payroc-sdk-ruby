# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the funding schedule of the processing account.
    class CreateFunding < Internal::Types::Model
      field :funding_accounts, -> { Internal::Types::Array[Payroc::Types::FundingAccount] }, optional: true, nullable: false, api_name: "fundingAccounts"
    end
  end
end
