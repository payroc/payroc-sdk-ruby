# frozen_string_literal: true

module Payroc
  module Types
    # Polymorphic object that indicates if the terminal accepts tips.
    #
    # The value of the enabled field determines which variant you should use:
    # -	`true` - Terminal allows tips.
    # -	`false` - Terminal doesn't allow tips.
    class ProcessingTerminalFeaturesTips < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      member -> { Payroc::Types::TipProcessingEnabled }
      member -> { Payroc::Types::TipProcessingDisabled }
    end
  end
end
