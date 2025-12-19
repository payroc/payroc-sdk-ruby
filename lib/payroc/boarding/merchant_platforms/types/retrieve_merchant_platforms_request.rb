# frozen_string_literal: true

module Payroc
  module Boarding
    module MerchantPlatforms
      module Types
        class RetrieveMerchantPlatformsRequest < Internal::Types::Model
          field :merchant_platform_id, -> { String }, optional: false, nullable: false, api_name: "merchantPlatformId"
        end
      end
    end
  end
end
