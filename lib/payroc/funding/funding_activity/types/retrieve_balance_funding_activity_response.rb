# frozen_string_literal: true

module Payroc
  module Funding
    module FundingActivity
      module Types
        class RetrieveBalanceFundingActivityResponse < Internal::Types::Model
          field :data, -> { Internal::Types::Array[Payroc::Types::MerchantBalance] }, optional: false, nullable: false
        end
      end
    end
  end
end
