# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the fees for American Express transactions.
    class InterchangePlusFeesAmex < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :type

      member -> { Payroc::Types::InterchangePlusAmexOptBlue }, key: "OPT_BLUE"
      member -> { Payroc::Types::InterchangePlusAmexDirect }, key: "DIRECT"
    end
  end
end
