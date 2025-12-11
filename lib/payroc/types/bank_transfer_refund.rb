# frozen_string_literal: true

module Payroc
  module Types
    class BankTransferRefund < Internal::Types::Model
      field :refund_id, -> { String }, optional: false, nullable: false, api_name: "refundId"
      field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
      field :order, -> { Payroc::Types::BankTransferRefundOrder }, optional: false, nullable: false
      field :customer, -> { Payroc::Types::BankTransferCustomer }, optional: true, nullable: false
      field :bank_account, -> { Payroc::Types::BankTransferRefundBankAccount }, optional: false, nullable: false, api_name: "bankAccount"
      field :payment, -> { Payroc::Types::PaymentSummary }, optional: true, nullable: false
      field :transaction_result, -> { Payroc::Types::BankTransferResult }, optional: false, nullable: false, api_name: "transactionResult"
      field :custom_fields, -> { Internal::Types::Array[Payroc::Types::CustomField] }, optional: true, nullable: false, api_name: "customFields"
    end
  end
end
