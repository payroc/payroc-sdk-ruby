# frozen_string_literal: true

module Payroc
  module Types
    class CreateProcessingAccount < Internal::Types::Model
      field :processing_account_id, -> { String }, optional: true, nullable: false, api_name: "processingAccountId"
      field :doing_business_as, -> { String }, optional: false, nullable: false, api_name: "doingBusinessAs"
      field :owners, -> { Internal::Types::Array[Payroc::Types::Owner] }, optional: false, nullable: false
      field :website, -> { String }, optional: true, nullable: false
      field :business_type, -> { Payroc::Types::CreateProcessingAccountBusinessType }, optional: false, nullable: false, api_name: "businessType"
      field :category_code, -> { Integer }, optional: false, nullable: false, api_name: "categoryCode"
      field :merchandise_or_service_sold, -> { String }, optional: false, nullable: false, api_name: "merchandiseOrServiceSold"
      field :business_start_date, -> { String }, optional: false, nullable: false, api_name: "businessStartDate"
      field :timezone, -> { Payroc::Types::Timezone }, optional: false, nullable: false
      field :address, -> { Payroc::Types::Address }, optional: false, nullable: false
      field :contact_methods, -> { Internal::Types::Array[Payroc::Types::ContactMethod] }, optional: false, nullable: false, api_name: "contactMethods"
      field :processing, -> { Payroc::Types::Processing }, optional: false, nullable: false
      field :funding, -> { Payroc::Types::CreateFunding }, optional: false, nullable: false
      field :pricing, -> { Payroc::Types::Pricing }, optional: false, nullable: false
      field :signature, -> { Payroc::Types::Signature }, optional: false, nullable: false
      field :contacts, -> { Internal::Types::Array[Payroc::Types::Contact] }, optional: true, nullable: false
      field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
    end
  end
end
