# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the customer's account details.
    class AchBankAccount < Internal::Types::Model
      field :sec_code, -> { Payroc::Types::AchBankAccountSecCode }, optional: true, nullable: false, api_name: "secCode"
      field :name_on_account, -> { String }, optional: false, nullable: false, api_name: "nameOnAccount"
      field :account_number, -> { String }, optional: false, nullable: false, api_name: "accountNumber"
      field :routing_number, -> { String }, optional: false, nullable: false, api_name: "routingNumber"
      field :secure_token, -> { Payroc::Types::SecureTokenSummary }, optional: true, nullable: false, api_name: "secureToken"
    end
  end
end
