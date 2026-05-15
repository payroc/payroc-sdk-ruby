# frozen_string_literal: true

module Payroc
  module Types
    # Polymorphic object that indicates the type of closed-loop card that the merchant accepts.
    class CustomizationOptionsClosedLoopOptions < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :type

      member -> { Payroc::Types::ClosedLoopOptionsMiFare }, key: "MIFARE"
    end
  end
end
