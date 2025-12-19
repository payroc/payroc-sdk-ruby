# frozen_string_literal: true

module Payroc
  module Types
    class SubscriptionPayment < Internal::Types::Model
      field :subscription_id, -> { String }, optional: false, nullable: false, api_name: "subscriptionId"
      field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
      field :payment, -> { Payroc::Types::PaymentSummary }, optional: false, nullable: false
      field :secure_token, -> { Payroc::Types::SecureTokenSummary }, optional: false, nullable: false, api_name: "secureToken"
      field :current_state, -> { Payroc::Types::SubscriptionState }, optional: false, nullable: false, api_name: "currentState"
      field :custom_fields, -> { Internal::Types::Array[Payroc::Types::CustomField] }, optional: true, nullable: false, api_name: "customFields"
    end
  end
end
