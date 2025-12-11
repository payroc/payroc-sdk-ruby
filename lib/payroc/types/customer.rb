# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the customer's contact details and address information.
    class Customer < Internal::Types::Model
      field :first_name, -> { String }, optional: true, nullable: false, api_name: "firstName"
      field :last_name, -> { String }, optional: true, nullable: false, api_name: "lastName"
      field :date_of_birth, -> { String }, optional: true, nullable: false, api_name: "dateOfBirth"
      field :reference_number, -> { String }, optional: true, nullable: false, api_name: "referenceNumber"
      field :billing_address, -> { Payroc::Types::Address }, optional: true, nullable: false, api_name: "billingAddress"
      field :shipping_address, -> { Payroc::Types::Shipping }, optional: true, nullable: false, api_name: "shippingAddress"
      field :contact_methods, -> { Internal::Types::Array[Payroc::Types::ContactMethod] }, optional: true, nullable: false, api_name: "contactMethods"
      field :notification_language, -> { Payroc::Types::CustomerNotificationLanguage }, optional: true, nullable: false, api_name: "notificationLanguage"
    end
  end
end
