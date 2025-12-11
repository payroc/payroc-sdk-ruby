# frozen_string_literal: true

module Payroc
  module Payments
    module Subscriptions
      module Types
        class PartiallyUpdateSubscriptionsRequest < Internal::Types::Model
          field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
          field :subscription_id, -> { String }, optional: false, nullable: false, api_name: "subscriptionId"
          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
          field :body, -> { Internal::Types::Array[Payroc::Types::PatchDocument] }, optional: false, nullable: false
        end
      end
    end
  end
end
