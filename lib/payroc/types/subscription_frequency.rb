# frozen_string_literal: true

module Payroc
  module Types
    module SubscriptionFrequency
      extend Payroc::Internal::Types::Enum

      WEEKLY = "weekly"
      FORTNIGHTLY = "fortnightly"
      MONTHLY = "monthly"
      QUARTERLY = "quarterly"
      YEARLY = "yearly"
    end
  end
end
