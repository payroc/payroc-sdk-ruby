# frozen_string_literal: true

module Payroc
  module Types
    class FundingAccount < Internal::Types::Model
      field :funding_account_id, -> { Integer }, optional: true, nullable: false, api_name: "fundingAccountId"
      field :created_date, -> { String }, optional: true, nullable: false, api_name: "createdDate"
      field :last_modified_date, -> { String }, optional: true, nullable: false, api_name: "lastModifiedDate"
      field :status, -> { Payroc::Types::FundingAccountStatus }, optional: true, nullable: false
      field :type, -> { Payroc::Types::FundingAccountType }, optional: false, nullable: false
      field :use, -> { Payroc::Types::FundingAccountUse }, optional: false, nullable: false
      field :name_on_account, -> { String }, optional: false, nullable: false, api_name: "nameOnAccount"
      field :payment_methods, -> { Internal::Types::Array[Payroc::Types::PaymentMethodsItem] }, optional: false, nullable: false, api_name: "paymentMethods"
      field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
      field :links, -> { Internal::Types::Array[Payroc::Types::Link] }, optional: true, nullable: false
    end
  end
end
