# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about a single-use payment link.
    class SingleUsePaymentLink < Internal::Types::Model
      field :payment_link_id, -> { String }, optional: true, nullable: false, api_name: "paymentLinkId"
      field :merchant_reference, -> { String }, optional: false, nullable: false, api_name: "merchantReference"
      field :order, -> { Payroc::Types::SingleUsePaymentLinkOrder }, optional: false, nullable: false
      field :auth_type, -> { Payroc::Types::SingleUsePaymentLinkAuthType }, optional: false, nullable: false, api_name: "authType"
      field :payment_methods, -> { Internal::Types::Array[Payroc::Types::SingleUsePaymentLinkPaymentMethodsItem] }, optional: false, nullable: false, api_name: "paymentMethods"
      field :custom_labels, -> { Internal::Types::Array[Payroc::Types::CustomLabel] }, optional: true, nullable: false, api_name: "customLabels"
      field :assets, -> { Payroc::Types::PaymentLinkAssets }, optional: true, nullable: false
      field :status, -> { Payroc::Types::SingleUsePaymentLinkStatus }, optional: true, nullable: false
      field :created_on, -> { String }, optional: true, nullable: false, api_name: "createdOn"
      field :expires_on, -> { String }, optional: false, nullable: false, api_name: "expiresOn"
      field :credential_on_file, -> { Payroc::Types::CredentialOnFile }, optional: true, nullable: false, api_name: "credentialOnFile"
    end
  end
end
