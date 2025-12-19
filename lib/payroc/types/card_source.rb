# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the customer's card details.
    class CardSource < Internal::Types::Model
      field :cardholder_name, -> { String }, optional: false, nullable: false, api_name: "cardholderName"
      field :card_number, -> { String }, optional: false, nullable: false, api_name: "cardNumber"
      field :expiry_date, -> { String }, optional: true, nullable: false, api_name: "expiryDate"
      field :card_type, -> { String }, optional: true, nullable: false, api_name: "cardType"
      field :currency, -> { Payroc::Types::Currency }, optional: true, nullable: false
      field :debit, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :surcharging, -> { Payroc::Types::Surcharging }, optional: true, nullable: false
    end
  end
end
