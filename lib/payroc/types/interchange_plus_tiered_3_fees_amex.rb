# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the fees for American Express transactions.
    class InterchangePlusTiered3FeesAmex < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :type

      member -> { Payroc::Types::InterchangePlusTiered3AmexOptBlue }, key: "OPT_BLUE"
      member -> { Payroc::Types::InterchangePlusTiered3AmexDirect }, key: "DIRECT"
    end
  end
end
