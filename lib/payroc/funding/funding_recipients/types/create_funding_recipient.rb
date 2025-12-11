# frozen_string_literal: true

module Payroc
  module Funding
    module FundingRecipients
      module Types
        class CreateFundingRecipient < Internal::Types::Model
          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
          field :recipient_type, -> { Payroc::Funding::FundingRecipients::Types::CreateFundingRecipientRecipientType }, optional: false, nullable: false, api_name: "recipientType"
          field :tax_id, -> { String }, optional: false, nullable: false, api_name: "taxId"
          field :charity_id, -> { String }, optional: true, nullable: false, api_name: "charityId"
          field :doing_business_as, -> { String }, optional: false, nullable: false, api_name: "doingBusinessAs"
          field :address, -> { Payroc::Types::Address }, optional: false, nullable: false
          field :contact_methods, -> { Internal::Types::Array[Payroc::Types::ContactMethod] }, optional: false, nullable: false, api_name: "contactMethods"
          field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
          field :owners, -> { Internal::Types::Array[Payroc::Types::Owner] }, optional: false, nullable: false
          field :funding_accounts, -> { Internal::Types::Array[Payroc::Types::FundingAccount] }, optional: false, nullable: false, api_name: "fundingAccounts"
        end
      end
    end
  end
end
