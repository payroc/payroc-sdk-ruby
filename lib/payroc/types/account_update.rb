# frozen_string_literal: true

module Payroc
  module Types
    # Polymorphic object that contains information about the single-use token.
    class AccountUpdate < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :type

      member -> { Payroc::Types::SingleUseTokenAccountUpdate }, key: "SINGLE_USE_TOKEN"
    end
  end
end
