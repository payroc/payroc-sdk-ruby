# frozen_string_literal: true

module Payroc
  module Boarding
    module ProcessingAccounts
      module Types
        # Object that contains the shipping preferences for the terminal order.
        class CreateTerminalOrderShippingPreferences < Internal::Types::Model
          field :method_, -> { Payroc::Boarding::ProcessingAccounts::Types::CreateTerminalOrderShippingPreferencesMethod }, optional: true, nullable: false, api_name: "method"
          field :saturday_delivery, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "saturdayDelivery"
        end
      end
    end
  end
end
