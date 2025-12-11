# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the status of the instruction
    class DeviceInstruction < Internal::Types::Model
      field :status, -> { Payroc::Types::DeviceInstructionStatus }, optional: true, nullable: false
      field :error_message, -> { String }, optional: true, nullable: false, api_name: "errorMessage"
      field :link, -> { Payroc::Types::Link }, optional: true, nullable: false
    end
  end
end
