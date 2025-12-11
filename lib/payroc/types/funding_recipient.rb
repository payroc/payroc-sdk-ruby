# frozen_string_literal: true

module Payroc
  module Types
    class FundingRecipient < Internal::Types::Model
      field :recipient_id, -> { Integer }, optional: true, nullable: false, api_name: "recipientId"
      field :status, -> { Payroc::Types::FundingRecipientStatus }, optional: true, nullable: false
      field :created_date, -> { String }, optional: true, nullable: false, api_name: "createdDate"
      field :last_modified_date, -> { String }, optional: true, nullable: false, api_name: "lastModifiedDate"
      field :recipient_type, -> { Payroc::Types::FundingRecipientRecipientType }, optional: false, nullable: false, api_name: "recipientType"
      field :tax_id, -> { String }, optional: false, nullable: false, api_name: "taxId"
      field :charity_id, -> { String }, optional: true, nullable: false, api_name: "charityId"
      field :doing_business_as, -> { String }, optional: false, nullable: false, api_name: "doingBusinessAs"
      field :address, -> { Payroc::Types::Address }, optional: false, nullable: false
      field :contact_methods, -> { Internal::Types::Array[Payroc::Types::ContactMethod] }, optional: false, nullable: false, api_name: "contactMethods"
      field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
      field :owners, -> { Internal::Types::Array[Payroc::Types::FundingRecipientOwnersItem] }, optional: true, nullable: false
      field :funding_accounts, -> { Internal::Types::Array[Payroc::Types::FundingRecipientFundingAccountsItem] }, optional: true, nullable: false, api_name: "fundingAccounts"
    end
  end
end
