# frozen_string_literal: true

module Payroc
  module PayrocCloud
    module RefundInstructions
      module Types
        class RefundInstructionRequest < Internal::Types::Model
          field :serial_number, -> { String }, optional: false, nullable: false, api_name: "serialNumber"
          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
          field :operator, -> { String }, optional: true, nullable: false
          field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
          field :order, -> { Payroc::Types::RefundInstructionOrder }, optional: false, nullable: false
          field :customer, -> { Payroc::Types::Customer }, optional: true, nullable: false
          field :ip_address, -> { Payroc::Types::IpAddress }, optional: true, nullable: false, api_name: "ipAddress"
          field :customization_options, -> { Payroc::Types::CustomizationOptions }, optional: true, nullable: false, api_name: "customizationOptions"
        end
      end
    end
  end
end
