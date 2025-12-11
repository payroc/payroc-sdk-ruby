# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the fees for American Express transactions.
    class InterchangePlusPlusFeesAmex < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :type

      member -> { Payroc::Types::InterchangePlusPlusAmexOptBlue }, key: "OPT_BLUE"
      member -> { Payroc::Types::InterchangePlusPlusAmexDirect }, key: "DIRECT"
    end
  end
end
