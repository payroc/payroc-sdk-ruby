# frozen_string_literal: true

module Payroc
  module RepeatPayments
    module Subscriptions
      module Types
        class SubscriptionRequest < Internal::Types::Model
          field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
          field :subscription_id, -> { String }, optional: false, nullable: false, api_name: "subscriptionId"
          field :payment_plan_id, -> { String }, optional: false, nullable: false, api_name: "paymentPlanId"
          field :payment_method, -> { Payroc::RepeatPayments::Subscriptions::Types::SubscriptionRequestPaymentMethod }, optional: false, nullable: false, api_name: "paymentMethod"
          field :name, -> { String }, optional: true, nullable: false
          field :description, -> { String }, optional: true, nullable: false
          field :setup_order, -> { Payroc::Types::SubscriptionPaymentOrderRequest }, optional: true, nullable: false, api_name: "setupOrder"
          field :recurring_order, -> { Payroc::Types::SubscriptionRecurringOrderRequest }, optional: true, nullable: false, api_name: "recurringOrder"
          field :start_date, -> { String }, optional: false, nullable: false, api_name: "startDate"
          field :end_date, -> { String }, optional: true, nullable: false, api_name: "endDate"
          field :length, -> { Integer }, optional: true, nullable: false
          field :pause_collection_for, -> { Integer }, optional: true, nullable: false, api_name: "pauseCollectionFor"
          field :custom_fields, -> { Internal::Types::Array[Payroc::Types::CustomField] }, optional: true, nullable: false, api_name: "customFields"
        end
      end
    end
  end
end
