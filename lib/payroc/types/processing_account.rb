# frozen_string_literal: true

module Payroc
  module Types
    class ProcessingAccount < Internal::Types::Model
      field :processing_account_id, -> { String }, optional: true, nullable: false, api_name: "processingAccountId"
      field :created_date, -> { String }, optional: true, nullable: false, api_name: "createdDate"
      field :last_modified_date, -> { String }, optional: true, nullable: false, api_name: "lastModifiedDate"
      field :status, -> { Payroc::Types::ProcessingAccountStatus }, optional: true, nullable: false
      field :doing_business_as, -> { String }, optional: false, nullable: false, api_name: "doingBusinessAs"
      field :owners, -> { Internal::Types::Array[Payroc::Types::ProcessingAccountOwnersItem] }, optional: true, nullable: false
      field :website, -> { String }, optional: true, nullable: false
      field :business_type, -> { Payroc::Types::ProcessingAccountBusinessType }, optional: false, nullable: false, api_name: "businessType"
      field :category_code, -> { Integer }, optional: false, nullable: false, api_name: "categoryCode"
      field :merchandise_or_service_sold, -> { String }, optional: false, nullable: false, api_name: "merchandiseOrServiceSold"
      field :business_start_date, -> { String }, optional: true, nullable: false, api_name: "businessStartDate"
      field :timezone, -> { Payroc::Types::Timezone }, optional: false, nullable: false
      field :address, -> { Payroc::Types::Address }, optional: false, nullable: false
      field :contact_methods, -> { Internal::Types::Array[Payroc::Types::ContactMethod] }, optional: false, nullable: false, api_name: "contactMethods"
      field :processing, -> { Payroc::Types::Processing }, optional: false, nullable: false
      field :funding, -> { Payroc::Funding::Types::Funding }, optional: false, nullable: false
      field :pricing, -> { Payroc::Types::ProcessingAccountPricing }, optional: false, nullable: false
      field :contacts, -> { Internal::Types::Array[Payroc::Types::ProcessingAccountContactsItem] }, optional: true, nullable: false
      field :signature, -> { Payroc::Types::Signature }, optional: false, nullable: false
      field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
      field :links, -> { Internal::Types::Array[Payroc::Types::Link] }, optional: true, nullable: false
    end
  end
end
