# frozen_string_literal: true

module Payroc
  module RepeatPayments
    module Subscriptions
      module Types
        class SubscriptionPaymentRequest < Internal::Types::Model
          field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
          field :subscription_id, -> { String }, optional: false, nullable: false, api_name: "subscriptionId"
          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
          field :operator, -> { String }, optional: true, nullable: false
          field :order, -> { Payroc::Types::SubscriptionPaymentOrder }, optional: false, nullable: false
          field :custom_fields, -> { Internal::Types::Array[Payroc::Types::CustomField] }, optional: true, nullable: false, api_name: "customFields"
        end
      end
    end
  end
end
