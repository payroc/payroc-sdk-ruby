# frozen_string_literal: true

module Payroc
  module Types
    class RetrievedPayment < Internal::Types::Model
      field :payment_id, -> { String }, optional: false, nullable: false, api_name: "paymentId"
      field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
      field :operator, -> { String }, optional: true, nullable: false
      field :order, -> { Payroc::Types::PaymentOrder }, optional: false, nullable: false
      field :customer, -> { Payroc::Types::RetrievedCustomer }, optional: true, nullable: false
      field :card, -> { Payroc::Types::RetrievedCard }, optional: false, nullable: false
      field :refunds, -> { Internal::Types::Array[Payroc::Types::RefundSummary] }, optional: true, nullable: false
      field :supported_operations, -> { Internal::Types::Array[Payroc::Types::SupportedOperationsItem] }, optional: true, nullable: false, api_name: "supportedOperations"
      field :transaction_result, -> { Payroc::Types::TransactionResult }, optional: false, nullable: false, api_name: "transactionResult"
      field :custom_fields, -> { Internal::Types::Array[Payroc::Types::CustomField] }, optional: true, nullable: false, api_name: "customFields"
    end
  end
end
