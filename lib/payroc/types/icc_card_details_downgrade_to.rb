# frozen_string_literal: true

module Payroc
  module Types
    module IccCardDetailsDowngradeTo
      extend Payroc::Internal::Types::Enum

      KEYED = "keyed"
      SWIPED = "swiped"
    end
  end
end
