# frozen_string_literal: true

module Payroc
  module Types
    # Polymorphic object that contains fees for American Express transactions.
    #
    # The value of the type field determines which variant you should use:
    # -	`optBlue` - Amex OptBlue pricing program.
    # -	`direct` - Amex Direct pricing program.
    class InterchangePlusPlusFeesAmex < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :type

      member -> { Payroc::Types::InterchangePlusPlusAmexOptBlue }, key: "OPT_BLUE"
      member -> { Payroc::Types::InterchangePlusPlusAmexDirect }, key: "DIRECT"
    end
  end
end
