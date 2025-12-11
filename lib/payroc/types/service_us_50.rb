# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the Hardware Advantage Plan.
    class ServiceUs50 < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :name

      member -> { Payroc::Types::HardwareAdvantagePlan }, key: "HARDWARE_ADVANTAGE_PLAN"
    end
  end
end
