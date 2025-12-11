# frozen_string_literal: true

module Payroc
  module Boarding
    module MerchantPlatforms
      module Types
        class CreateProcessingAccountMerchantPlatformsRequest < Internal::Types::Model
          field :merchant_platform_id, -> { String }, optional: false, nullable: false, api_name: "merchantPlatformId"
          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
          field :body, -> { Payroc::Types::CreateProcessingAccount }, optional: false, nullable: false
        end
      end
    end
  end
end
