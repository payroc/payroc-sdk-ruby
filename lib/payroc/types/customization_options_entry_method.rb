# frozen_string_literal: true

module Payroc
  module Types
    module CustomizationOptionsEntryMethod
      extend Payroc::Internal::Types::Enum

      DEVICE_READ = "deviceRead"
      MANUAL_ENTRY = "manualEntry"
      DEVICE_READ_OR_MANUAL_ENTRY = "deviceReadOrManualEntry"
    end
  end
end
