# frozen_string_literal: true

module Payroc
  module Payments
    module Types
      class PaymentRequest < Internal::Types::Model
        field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
        field :channel, -> { Payroc::Payments::Types::PaymentRequestChannel }, optional: false, nullable: false
        field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
        field :operator, -> { String }, optional: true, nullable: false
        field :order, -> { Payroc::Types::PaymentOrderRequest }, optional: false, nullable: false
        field :customer, -> { Payroc::Types::Customer }, optional: true, nullable: false
        field :ip_address, -> { Payroc::Types::IpAddress }, optional: true, nullable: false, api_name: "ipAddress"
        field :payment_method, -> { Payroc::Payments::Types::PaymentRequestPaymentMethod }, optional: false, nullable: false, api_name: "paymentMethod"
        field :three_d_secure, -> { Payroc::Payments::Types::PaymentRequestThreeDSecure }, optional: true, nullable: false, api_name: "threeDSecure"
        field :credential_on_file, -> { Payroc::Types::SchemasCredentialOnFile }, optional: true, nullable: false, api_name: "credentialOnFile"
        field :offline_processing, -> { Payroc::Types::OfflineProcessing }, optional: true, nullable: false, api_name: "offlineProcessing"
        field :auto_capture, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "autoCapture"
        field :process_as_sale, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "processAsSale"
        field :custom_fields, -> { Internal::Types::Array[Payroc::Types::CustomField] }, optional: true, nullable: false, api_name: "customFields"
      end
    end
  end
end
