# frozen_string_literal: true

module Payroc
  module Funding
    module FundingActivity
      module Types
        class RetrieveBalanceFundingActivityRequest < Internal::Types::Model
          field :before, -> { String }, optional: true, nullable: false
          field :after, -> { String }, optional: true, nullable: false
          field :limit, -> { Integer }, optional: true, nullable: false
          field :merchant_id, -> { String }, optional: true, nullable: false, api_name: "merchantId"
        end
      end
    end
  end
end
