# frozen_string_literal: true

module Payroc
  module Types
    module PaymentPlanBaseOnDelete
      extend Payroc::Internal::Types::Enum

      COMPLETE = "complete"
      CONTINUE = "continue"
    end
  end
end
