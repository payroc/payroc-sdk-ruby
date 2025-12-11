# frozen_string_literal: true

module Payroc
  module Types
    class FundingRecipientFundingAccountsItem < Internal::Types::Model
      field :funding_account_id, -> { Integer }, optional: true, nullable: false, api_name: "fundingAccountId"
      field :status, -> { Payroc::Types::FundingRecipientFundingAccountsItemStatus }, optional: true, nullable: false
      field :link, -> { Payroc::Types::FundingRecipientFundingAccountsItemLink }, optional: true, nullable: false
    end
  end
end
