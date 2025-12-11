# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the Hardware Advantage Plan.
    class HardwareAdvantagePlan < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
