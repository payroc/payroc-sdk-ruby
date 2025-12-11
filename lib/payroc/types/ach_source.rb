# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the customer's account details.
    class AchSource < Internal::Types::Model
      field :name_on_account, -> { String }, optional: false, nullable: false, api_name: "nameOnAccount"
      field :account_number, -> { String }, optional: false, nullable: false, api_name: "accountNumber"
      field :routing_number, -> { String }, optional: false, nullable: false, api_name: "routingNumber"
    end
  end
end
