# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the device settings if the solution includes a terminal or a peripheral device such as a
    # printer.
    class OrderItemSolutionSetupDeviceSettings < Internal::Types::Model
      field :number_of_mobile_users, -> { Integer }, optional: true, nullable: false, api_name: "numberOfMobileUsers"
      field :communication_type, -> { Payroc::Types::OrderItemSolutionSetupDeviceSettingsCommunicationType }, optional: true, nullable: false, api_name: "communicationType"
    end
  end
end
