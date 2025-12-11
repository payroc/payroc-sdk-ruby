# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the single-use token.
    class AccountUpdate < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :type

      member -> { Payroc::Types::SingleUseTokenAccountUpdate }, key: "SINGLE_USE_TOKEN"
    end
  end
end
