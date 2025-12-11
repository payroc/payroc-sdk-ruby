# frozen_string_literal: true

module Payroc
  module Boarding
    module ProcessingAccounts
      module Types
        # Object that contains the shipping address for the terminal order.
        class CreateTerminalOrderShippingAddress < Internal::Types::Model
          field :recipient_name, -> { String }, optional: false, nullable: false, api_name: "recipientName"
          field :business_name, -> { String }, optional: true, nullable: false, api_name: "businessName"
          field :address_line_1, -> { String }, optional: false, nullable: false, api_name: "addressLine1"
          field :address_line_2, -> { String }, optional: true, nullable: false, api_name: "addressLine2"
          field :city, -> { String }, optional: false, nullable: false
          field :state, -> { String }, optional: false, nullable: false
          field :postal_code, -> { String }, optional: false, nullable: false, api_name: "postalCode"
          field :email, -> { String }, optional: false, nullable: false
          field :phone, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
