# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the payment details for the customer’s automated clearing house (ACH)
    # transactions.
    class AchPayload < Internal::Types::Model
      field :account_type, -> { Payroc::Types::AchPayloadAccountType }, optional: true, nullable: false, api_name: "accountType"
      field :sec_code, -> { Payroc::Types::AchPayloadSecCode }, optional: true, nullable: false, api_name: "secCode"
      field :name_on_account, -> { String }, optional: false, nullable: false, api_name: "nameOnAccount"
      field :account_number, -> { String }, optional: false, nullable: false, api_name: "accountNumber"
      field :routing_number, -> { String }, optional: false, nullable: false, api_name: "routingNumber"
    end
  end
end
