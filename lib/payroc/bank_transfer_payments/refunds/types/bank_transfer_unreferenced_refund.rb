# frozen_string_literal: true

module Payroc
  module BankTransferPayments
    module Refunds
      module Types
        class BankTransferUnreferencedRefund < Internal::Types::Model
          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
          field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
          field :order, -> { Payroc::Types::BankTransferRefundOrder }, optional: false, nullable: false
          field :customer, -> { Payroc::Types::BankTransferCustomer }, optional: true, nullable: false
          field :refund_method, -> { Payroc::BankTransferPayments::Refunds::Types::BankTransferUnreferencedRefundRefundMethod }, optional: false, nullable: false, api_name: "refundMethod"
          field :custom_fields, -> { Internal::Types::Array[Payroc::Types::CustomField] }, optional: true, nullable: false, api_name: "customFields"
        end
      end
    end
  end
end
