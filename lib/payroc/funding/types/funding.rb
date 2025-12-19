# frozen_string_literal: true

module Payroc
  module Funding
    module Types
      # Object that contains funding information for the processing account, including funding schedules, funding fees,
      # and details of funding accounts.
      class Funding < Internal::Types::Model
        field :funding_accounts, -> { Internal::Types::Array[Payroc::Types::FundingAccountSummary] }, optional: true, nullable: false, api_name: "fundingAccounts"
      end
    end
  end
end
