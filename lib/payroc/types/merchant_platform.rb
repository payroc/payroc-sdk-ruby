# frozen_string_literal: true

module Payroc
  module Types
    class MerchantPlatform < Internal::Types::Model
      field :merchant_platform_id, -> { String }, optional: true, nullable: false, api_name: "merchantPlatformId"
      field :created_date, -> { String }, optional: true, nullable: false, api_name: "createdDate"
      field :last_modified_date, -> { String }, optional: true, nullable: false, api_name: "lastModifiedDate"
      field :business, -> { Payroc::Types::Business }, optional: false, nullable: false
      field :processing_accounts, -> { Internal::Types::Array[Payroc::Types::MerchantPlatformProcessingAccountsItem] }, optional: true, nullable: false, api_name: "processingAccounts"
      field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
      field :links, -> { Internal::Types::Array[Payroc::Types::Link] }, optional: true, nullable: false
    end
  end
end
