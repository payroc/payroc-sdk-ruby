# frozen_string_literal: true

module Payroc
  module Boarding
    module MerchantPlatforms
      module Types
        class CreateMerchantAccount < Internal::Types::Model
          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
          field :business, -> { Payroc::Types::Business }, optional: false, nullable: false
          field :processing_accounts, -> { Internal::Types::Array[Payroc::Types::CreateProcessingAccount] }, optional: false, nullable: false, api_name: "processingAccounts"
          field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
        end
      end
    end
  end
end
