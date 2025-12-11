# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the tax details.
    class Tax < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :type

      member -> { Payroc::Types::TaxAmount }, key: "AMOUNT"
      member -> { Payroc::Types::TaxRate }, key: "RATE"
    end
  end
end
