# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the tip settings for the processing terminal.
    class ProcessingTerminalFeaturesTips < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      member -> { Payroc::Types::TipProcessingEnabled }
      member -> { Payroc::Types::TipProcessingDisabled }
    end
  end
end
