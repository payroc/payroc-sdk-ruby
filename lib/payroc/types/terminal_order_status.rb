# frozen_string_literal: true

module Payroc
  module Types
    module TerminalOrderStatus
      extend Payroc::Internal::Types::Enum

      OPEN = "open"
      HELD = "held"
      DISPATCHED = "dispatched"
      FULFILLED = "fulfilled"
      CANCELLED = "cancelled"
    end
  end
end
