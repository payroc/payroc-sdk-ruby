# frozen_string_literal: true

module Payroc
  module Types
    # Polymorphic object that contains tax details.
    #
    # The value of the type parameter determines which variant you should use:
    # -	`amount` - Tax is a fixed amount.
    # -	`rate` - Tax is a percentage.
    class Tax < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :type

      member -> { Payroc::Types::TaxAmount }, key: "AMOUNT"
      member -> { Payroc::Types::TaxRate }, key: "RATE"
    end
  end
end
