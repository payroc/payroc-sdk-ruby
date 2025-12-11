# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the sale and the customer's bank details.
    class BankTransferPayment < Internal::Types::Model
      field :payment_id, -> { String }, optional: false, nullable: false, api_name: "paymentId"
      field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
      field :order, -> { Payroc::Types::BankTransferPaymentOrder }, optional: false, nullable: false
      field :customer, -> { Payroc::Types::BankTransferCustomer }, optional: true, nullable: false
      field :bank_account, -> { Payroc::Types::BankTransferPaymentBankAccount }, optional: false, nullable: false, api_name: "bankAccount"
      field :refunds, -> { Internal::Types::Array[Payroc::Types::RefundSummary] }, optional: true, nullable: false
      field :returns, -> { Internal::Types::Array[Payroc::Types::BankTransferReturnSummary] }, optional: true, nullable: false
      field :representment, -> { Payroc::Types::PaymentSummary }, optional: true, nullable: false
      field :transaction_result, -> { Payroc::Types::BankTransferResult }, optional: false, nullable: false, api_name: "transactionResult"
      field :custom_fields, -> { Internal::Types::Array[Payroc::Types::CustomField] }, optional: true, nullable: false, api_name: "customFields"
    end
  end
end
