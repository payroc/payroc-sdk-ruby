# frozen_string_literal: true

module Payroc
  module Funding
    module FundingAccounts
      module Types
        class UpdateFundingAccountsRequest < Internal::Types::Model
          field :funding_account_id, -> { Integer }, optional: false, nullable: false, api_name: "fundingAccountId"
          field :body, -> { Payroc::Types::FundingAccount }, optional: false, nullable: false
        end
      end
    end
  end
end
