# frozen_string_literal: true

module Payroc
  module Types
    module PaymentPlanBaseType
      extend Payroc::Internal::Types::Enum

      MANUAL = "manual"
      AUTOMATIC = "automatic"
    end
  end
end
