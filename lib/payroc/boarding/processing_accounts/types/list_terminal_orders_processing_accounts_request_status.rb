# frozen_string_literal: true

module Payroc
  module Boarding
    module ProcessingAccounts
      module Types
        module ListTerminalOrdersProcessingAccountsRequestStatus
          extend Payroc::Internal::Types::Enum

          OPEN = "open"
          HELD = "held"
          DISPATCHED = "dispatched"
          FULFILLED = "fulfilled"
          CANCELLED = "cancelled"
        end
      end
    end
  end
end
