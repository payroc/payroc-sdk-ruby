# frozen_string_literal: true

module Payroc
  module Notifications
    module EventSubscriptions
      module Types
        class DeleteEventSubscriptionsRequest < Internal::Types::Model
          field :subscription_id, -> { Integer }, optional: false, nullable: false, api_name: "subscriptionId"
        end
      end
    end
  end
end
