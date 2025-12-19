# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the fees for American Express transactions.
    class Tiered3FeesAmex < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :type

      member -> { Payroc::Types::Tiered3AmexOptBlue }, key: "OPT_BLUE"
      member -> { Payroc::Types::Tiered3AmexDirect }, key: "DIRECT"
    end
  end
end
