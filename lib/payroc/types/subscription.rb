# frozen_string_literal: true

module Payroc
  module Types
    class Subscription < Internal::Types::Model
      field :subscription_id, -> { String }, optional: false, nullable: false, api_name: "subscriptionId"
      field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
      field :payment_plan, -> { Payroc::Types::PaymentPlanSummary }, optional: false, nullable: false, api_name: "paymentPlan"
      field :secure_token, -> { Payroc::Types::SecureTokenSummary }, optional: false, nullable: false, api_name: "secureToken"
      field :name, -> { String }, optional: false, nullable: false
      field :description, -> { String }, optional: true, nullable: false
      field :currency, -> { Payroc::Types::Currency }, optional: false, nullable: false
      field :setup_order, -> { Payroc::Types::SubscriptionPaymentOrder }, optional: true, nullable: false, api_name: "setupOrder"
      field :recurring_order, -> { Payroc::Types::SubscriptionRecurringOrder }, optional: true, nullable: false, api_name: "recurringOrder"
      field :current_state, -> { Payroc::Types::SubscriptionState }, optional: false, nullable: false, api_name: "currentState"
      field :start_date, -> { String }, optional: false, nullable: false, api_name: "startDate"
      field :end_date, -> { String }, optional: true, nullable: false, api_name: "endDate"
      field :length, -> { Integer }, optional: true, nullable: false
      field :type, -> { Payroc::Types::SubscriptionType }, optional: false, nullable: false
      field :frequency, -> { Payroc::Types::SubscriptionFrequency }, optional: false, nullable: false
      field :pause_collection_for, -> { Integer }, optional: true, nullable: false, api_name: "pauseCollectionFor"
      field :custom_fields, -> { Internal::Types::Array[Payroc::Types::CustomField] }, optional: true, nullable: false, api_name: "customFields"
    end
  end
end
