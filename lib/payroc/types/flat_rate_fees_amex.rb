# frozen_string_literal: true

module Payroc
  module Types
    # Polymorphic object that contains fees for American Express transactions.
    class FlatRateFeesAmex < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :type

      member -> { Payroc::Types::FlatRateAmexDirect }, key: "DIRECT"
    end
  end
end
