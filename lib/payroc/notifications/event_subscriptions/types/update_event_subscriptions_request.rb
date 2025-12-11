# frozen_string_literal: true

module Payroc
  module Notifications
    module EventSubscriptions
      module Types
        class UpdateEventSubscriptionsRequest < Internal::Types::Model
          field :subscription_id, -> { Integer }, optional: false, nullable: false, api_name: "subscriptionId"
          field :body, -> { Payroc::Types::EventSubscription }, optional: false, nullable: false
        end
      end
    end
  end
end
