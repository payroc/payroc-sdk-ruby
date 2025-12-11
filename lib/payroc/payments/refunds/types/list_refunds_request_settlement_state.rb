# frozen_string_literal: true

module Payroc
  module Payments
    module Refunds
      module Types
        module ListRefundsRequestSettlementState
          extend Payroc::Internal::Types::Enum

          SETTLED = "settled"
          UNSETTLED = "unsettled"
        end
      end
    end
  end
end
