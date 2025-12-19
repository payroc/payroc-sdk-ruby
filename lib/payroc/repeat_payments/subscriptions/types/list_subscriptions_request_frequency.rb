# frozen_string_literal: true

module Payroc
  module RepeatPayments
    module Subscriptions
      module Types
        module ListSubscriptionsRequestFrequency
          extend Payroc::Internal::Types::Enum

          WEEKLY = "weekly"
          FORTNIGHTLY = "fortnightly"
          MONTHLY = "monthly"
          QUARTERLY = "quarterly"
          YEARLY = "yearly"
        end
      end
    end
  end
end
