# frozen_string_literal: true

module Payroc
  module Funding
    module FundingAccounts
      module Types
        class DeleteFundingAccountsRequest < Internal::Types::Model
          field :funding_account_id, -> { Integer }, optional: false, nullable: false, api_name: "fundingAccountId"
        end
      end
    end
  end
end
