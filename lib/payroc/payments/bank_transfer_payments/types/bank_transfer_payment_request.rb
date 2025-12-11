# frozen_string_literal: true

module Payroc
  module Payments
    module BankTransferPayments
      module Types
        class BankTransferPaymentRequest < Internal::Types::Model
          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
          field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
          field :order, -> { Payroc::Types::BankTransferPaymentRequestOrder }, optional: false, nullable: false
          field :customer, -> { Payroc::Types::BankTransferCustomer }, optional: true, nullable: false
          field :credential_on_file, -> { Payroc::Types::SchemasCredentialOnFile }, optional: true, nullable: false, api_name: "credentialOnFile"
          field :payment_method, -> { Payroc::Payments::BankTransferPayments::Types::BankTransferPaymentRequestPaymentMethod }, optional: false, nullable: false, api_name: "paymentMethod"
          field :custom_fields, -> { Internal::Types::Array[Payroc::Types::CustomField] }, optional: true, nullable: false, api_name: "customFields"
        end
      end
    end
  end
end
