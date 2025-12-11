# frozen_string_literal: true

module Payroc
  module Types
    module StandingInstructionsProcessingModel
      extend Payroc::Internal::Types::Enum

      UNSCHEDULED = "unscheduled"
      RECURRING = "recurring"
      INSTALLMENT = "installment"
    end
  end
end
