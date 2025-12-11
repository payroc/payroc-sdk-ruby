# frozen_string_literal: true

module Payroc
  module Types
    module SubscriptionType
      extend Payroc::Internal::Types::Enum

      MANUAL = "manual"
      AUTOMATIC = "automatic"
    end
  end
end
