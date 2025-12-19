# frozen_string_literal: true

module Payroc
  module Types
    module DeviceInstructionStatus
      extend Payroc::Internal::Types::Enum

      CANCELED = "canceled"
      COMPLETED = "completed"
      FAILURE = "failure"
      IN_PROGRESS = "inProgress"
    end
  end
end
