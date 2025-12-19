# frozen_string_literal: true

module Payroc
  module Types
    module InstructionStatus
      extend Payroc::Internal::Types::Enum

      ACCEPTED = "accepted"
      PENDING = "pending"
      COMPLETED = "completed"
    end
  end
end
