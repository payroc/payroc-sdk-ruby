# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the IP address of the device that sent the request.
    class IpAddress < Internal::Types::Model
      field :type, -> { Payroc::Types::IpAddressType }, optional: false, nullable: false
      field :value, -> { String }, optional: false, nullable: false
    end
  end
end
