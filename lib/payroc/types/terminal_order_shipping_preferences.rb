# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the shipping preferences for the terminal order.
    class TerminalOrderShippingPreferences < Internal::Types::Model
      field :method_, -> { Payroc::Types::TerminalOrderShippingPreferencesMethod }, optional: true, nullable: false, api_name: "method"
      field :saturday_delivery, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "saturdayDelivery"
    end
  end
end
