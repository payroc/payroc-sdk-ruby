# frozen_string_literal: true

module Payroc
  module Types
    module CommunicationType
      extend Payroc::Internal::Types::Enum

      BLUETOOTH = "bluetooth"
      CELLULAR = "cellular"
      ETHERNET = "ethernet"
      WIFI = "wifi"
    end
  end
end
