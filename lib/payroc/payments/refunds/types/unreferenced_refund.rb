# frozen_string_literal: true

module Payroc
  module Payments
    module Refunds
      module Types
        class UnreferencedRefund < Internal::Types::Model
          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
          field :channel, -> { Payroc::Payments::Refunds::Types::UnreferencedRefundChannel }, optional: false, nullable: false
          field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
          field :operator, -> { String }, optional: true, nullable: false
          field :order, -> { Payroc::Types::RefundOrder }, optional: false, nullable: false
          field :customer, -> { Payroc::Types::Customer }, optional: true, nullable: false
          field :ip_address, -> { Payroc::Types::IpAddress }, optional: true, nullable: false, api_name: "ipAddress"
          field :refund_method, -> { Payroc::Payments::Refunds::Types::UnreferencedRefundRefundMethod }, optional: false, nullable: false, api_name: "refundMethod"
          field :custom_fields, -> { Internal::Types::Array[Payroc::Types::CustomField] }, optional: true, nullable: false, api_name: "customFields"
        end
      end
    end
  end
end
