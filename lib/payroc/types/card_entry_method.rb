# frozen_string_literal: true

module Payroc
  module Types
    module CardEntryMethod
      extend Payroc::Internal::Types::Enum

      ICC = "icc"
      KEYED = "keyed"
      SWIPED = "swiped"
      SWIPED_FALLBACK = "swipedFallback"
      CONTACTLESS_ICC = "contactlessIcc"
      CONTACTLESS_MSR = "contactlessMsr"
    end
  end
end
