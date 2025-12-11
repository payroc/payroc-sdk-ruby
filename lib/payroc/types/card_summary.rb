# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the card.
    class CardSummary < Internal::Types::Model
      field :card_number, -> { String }, optional: true, nullable: false, api_name: "cardNumber"
      field :type, -> { Payroc::Types::CardSummaryType }, optional: true, nullable: false
      field :cvv_presence_indicator, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "cvvPresenceIndicator"
      field :avs_request, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "avsRequest"
      field :avs_response, -> { String }, optional: true, nullable: false, api_name: "avsResponse"
    end
  end
end
