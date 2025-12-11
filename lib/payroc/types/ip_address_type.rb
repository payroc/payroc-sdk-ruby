# frozen_string_literal: true

module Payroc
  module Types
    module IpAddressType
      extend Payroc::Internal::Types::Enum

      IPV_4 = "ipv4"
      IPV_6 = "ipv6"
    end
  end
end
