# frozen_string_literal: true

module Payroc
  module Types
    class MerchantPlatformProcessingAccountsItem < Internal::Types::Model
      field :processing_account_id, -> { String }, optional: true, nullable: false, api_name: "processingAccountId"
      field :doing_business_as, -> { String }, optional: false, nullable: false, api_name: "doingBusinessAs"
      field :status, -> { Payroc::Types::MerchantPlatformProcessingAccountsItemStatus }, optional: true, nullable: false
      field :link, -> { Payroc::Types::MerchantPlatformProcessingAccountsItemLink }, optional: true, nullable: false
      field :signature, -> { Payroc::Types::Signature }, optional: true, nullable: false
    end
  end
end
