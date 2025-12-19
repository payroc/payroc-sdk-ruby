# frozen_string_literal: true

module Payroc
  module Types
    class FundingAccountSummary < Internal::Types::Model
      field :funding_account_id, -> { Integer }, optional: true, nullable: false, api_name: "fundingAccountId"
      field :status, -> { Payroc::Types::FundingAccountSummaryStatus }, optional: true, nullable: false
      field :link, -> { Payroc::Types::Link }, optional: true, nullable: false
    end
  end
end
