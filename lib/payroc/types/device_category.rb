# frozen_string_literal: true

module Payroc
  module Types
    module DeviceCategory
      extend Payroc::Internal::Types::Enum

      ATTENDED = "attended"
      UNATTENDED = "unattended"
    end
  end
end
