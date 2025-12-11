# frozen_string_literal: true

module Payroc
  module PayrocCloud
    module PaymentInstructions
      module Types
        class PaymentInstructionRequest < Internal::Types::Model
          field :serial_number, -> { String }, optional: false, nullable: false, api_name: "serialNumber"
          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
          field :operator, -> { String }, optional: true, nullable: false
          field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
          field :order, -> { Payroc::Types::PaymentInstructionOrder }, optional: false, nullable: false
          field :customer, -> { Payroc::Types::Customer }, optional: true, nullable: false
          field :ip_address, -> { Payroc::Types::IpAddress }, optional: true, nullable: false, api_name: "ipAddress"
          field :credential_on_file, -> { Payroc::Types::SchemasCredentialOnFile }, optional: true, nullable: false, api_name: "credentialOnFile"
          field :customization_options, -> { Payroc::Types::CustomizationOptions }, optional: true, nullable: false, api_name: "customizationOptions"
          field :auto_capture, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "autoCapture"
          field :process_as_sale, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "processAsSale"
        end
      end
    end
  end
end
