# frozen_string_literal: true

module Payroc
  module Types
    module TipMode
      extend Payroc::Internal::Types::Enum

      PROMPTED = "prompted"
      ADJUSTED = "adjusted"
    end
  end
end
