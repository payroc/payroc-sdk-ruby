# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the physical device the merchant used to capture the customer’s card
    # details.
    class Device < Internal::Types::Model
      field :model, -> { Payroc::Types::DeviceModel }, optional: false, nullable: false
      field :category, -> { Payroc::Types::DeviceCategory }, optional: true, nullable: false
      field :serial_number, -> { String }, optional: false, nullable: false, api_name: "serialNumber"
      field :firmware_version, -> { String }, optional: true, nullable: false, api_name: "firmwareVersion"
      field :config, -> { Payroc::Types::DeviceConfig }, optional: true, nullable: false
    end
  end
end
