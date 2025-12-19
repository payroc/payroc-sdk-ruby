# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the customer.
    class BankTransferCustomer < Internal::Types::Model
      field :notification_language, -> { Payroc::Types::BankTransferCustomerNotificationLanguage }, optional: true, nullable: false, api_name: "notificationLanguage"
      field :contact_methods, -> { Internal::Types::Array[Payroc::Types::ContactMethod] }, optional: true, nullable: false, api_name: "contactMethods"
    end
  end
end
