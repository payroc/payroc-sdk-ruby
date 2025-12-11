# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the funding account.
    class PaymentMethodAchValue < Internal::Types::Model
      field :routing_number, -> { String }, optional: false, nullable: false, api_name: "routingNumber"
      field :account_number, -> { String }, optional: false, nullable: false, api_name: "accountNumber"
    end
  end
end
