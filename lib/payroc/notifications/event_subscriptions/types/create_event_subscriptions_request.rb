# frozen_string_literal: true

module Payroc
  module Notifications
    module EventSubscriptions
      module Types
        class CreateEventSubscriptionsRequest < Internal::Types::Model
          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
          field :body, -> { Payroc::Types::EventSubscription }, optional: false, nullable: false
        end
      end
    end
  end
end
