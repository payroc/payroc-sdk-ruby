# frozen_string_literal: true

module Payroc
  module Payments
    module Types
      module ListPaymentsRequestTipModeItem
        extend Payroc::Internal::Types::Enum

        NO_TIP = "noTip"
        PROMPTED = "prompted"
        ADJUSTED = "adjusted"
      end
    end
  end
end
