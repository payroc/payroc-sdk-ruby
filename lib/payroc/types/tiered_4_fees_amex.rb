# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the fees for American Express transactions.
    class Tiered4FeesAmex < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :type

      member -> { Payroc::Types::Tiered4AmexOptBlue }, key: "OPT_BLUE"
      member -> { Payroc::Types::Tiered4AmexDirect }, key: "DIRECT"
    end
  end
end
