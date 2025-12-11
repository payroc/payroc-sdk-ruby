# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the adjustment to the transaction. Send this object if the merchant is
    # adjusting the customer’s contact details.
    class CustomerAdjustment < Internal::Types::Model
      field :shipping_address, -> { Payroc::Types::Shipping }, optional: true, nullable: false, api_name: "shippingAddress"
      field :contact_methods, -> { Internal::Types::Array[Payroc::Types::ContactMethod] }, optional: true, nullable: false, api_name: "contactMethods"
    end
  end
end
