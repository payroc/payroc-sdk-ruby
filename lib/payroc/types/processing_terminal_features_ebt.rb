# frozen_string_literal: true

module Payroc
  module Types
    # Polymorphic object that indicates if the terminal accepts EBT transactions.
    #
    # The value of the enabled field determines which variant you should use:
    # -	`true` - Terminal allows EBT transactions.
    # -	`false` - Terminal doesn't allow EBT transactions.
    class ProcessingTerminalFeaturesEbt < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      member -> { Payroc::Types::EbtEnabled }
      member -> { Payroc::Types::EbtDisabled }
    end
  end
end
