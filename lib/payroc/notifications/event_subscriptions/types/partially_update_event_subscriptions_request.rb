# frozen_string_literal: true

module Payroc
  module Notifications
    module EventSubscriptions
      module Types
        class PartiallyUpdateEventSubscriptionsRequest < Internal::Types::Model
          field :subscription_id, -> { Integer }, optional: false, nullable: false, api_name: "subscriptionId"
          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
          field :body, -> { Internal::Types::Array[Payroc::Types::PatchDocument] }, optional: false, nullable: false
        end
      end
    end
  end
end
