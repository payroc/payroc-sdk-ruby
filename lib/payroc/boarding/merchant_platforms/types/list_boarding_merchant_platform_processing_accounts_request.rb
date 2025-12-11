# frozen_string_literal: true

module Payroc
  module Boarding
    module MerchantPlatforms
      module Types
        class ListBoardingMerchantPlatformProcessingAccountsRequest < Internal::Types::Model
          field :merchant_platform_id, -> { String }, optional: false, nullable: false, api_name: "merchantPlatformId"
          field :before, -> { String }, optional: true, nullable: false
          field :after, -> { String }, optional: true, nullable: false
          field :limit, -> { Integer }, optional: true, nullable: false
          field :include_closed, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "includeClosed"
        end
      end
    end
  end
end
