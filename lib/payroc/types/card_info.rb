# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the card.
    class CardInfo < Internal::Types::Model
      field :type, -> { String }, optional: false, nullable: false
      field :card_number, -> { String }, optional: false, nullable: false, api_name: "cardNumber"
      field :country, -> { String }, optional: true, nullable: false
      field :currency, -> { Payroc::Types::Currency }, optional: true, nullable: false
      field :debit, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :surcharging, -> { Payroc::Types::Surcharging }, optional: true, nullable: false
    end
  end
end
