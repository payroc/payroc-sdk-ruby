# frozen_string_literal: true

module Payroc
  module Payments
    module Types
      module ListPaymentsRequestSettlementState
        extend Payroc::Internal::Types::Enum

        SETTLED = "settled"
        UNSETTLED = "unsettled"
      end
    end
  end
end
