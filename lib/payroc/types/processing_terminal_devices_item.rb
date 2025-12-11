# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the details of the device.
    class ProcessingTerminalDevicesItem < Internal::Types::Model
      field :manufacturer, -> { String }, optional: false, nullable: false
      field :model, -> { String }, optional: false, nullable: false
      field :serial_number, -> { String }, optional: false, nullable: false, api_name: "serialNumber"
      field :communication_type, -> { Payroc::Types::CommunicationType }, optional: true, nullable: false, api_name: "communicationType"
    end
  end
end
