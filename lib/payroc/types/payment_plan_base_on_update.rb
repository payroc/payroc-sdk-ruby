# frozen_string_literal: true

module Payroc
  module Types
    module PaymentPlanBaseOnUpdate
      extend Payroc::Internal::Types::Enum

      UPDATE = "update"
      CONTINUE = "continue"
    end
  end
end
