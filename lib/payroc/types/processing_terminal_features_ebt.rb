# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains details about EBT transactions.
    class ProcessingTerminalFeaturesEbt < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      member -> { Payroc::Types::EbtEnabled }
      member -> { Payroc::Types::EbtDisabled }
    end
  end
end
