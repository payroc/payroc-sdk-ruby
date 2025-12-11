# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the configuration of the POS terminal.
    class DeviceConfig < Internal::Types::Model
      field :quick_chip, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "quickChip"
    end
  end
end
