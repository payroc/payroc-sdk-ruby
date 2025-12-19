# frozen_string_literal: true

module Payroc
  module Types
    class ProcessingTerminal < Internal::Types::Model
      field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
      field :status, -> { Payroc::Types::ProcessingTerminalStatus }, optional: false, nullable: false
      field :timezone, -> { Payroc::Types::ProcessingTerminalTimezone }, optional: false, nullable: false
      field :program, -> { String }, optional: true, nullable: false
      field :gateway, -> { Payroc::Types::PayrocGateway }, optional: true, nullable: false
      field :batch_closure, -> { Payroc::Types::ProcessingTerminalBatchClosure }, optional: false, nullable: false, api_name: "batchClosure"
      field :application_settings, -> { Payroc::Types::ProcessingTerminalApplicationSettings }, optional: false, nullable: false, api_name: "applicationSettings"
      field :features, -> { Payroc::Types::ProcessingTerminalFeatures }, optional: false, nullable: false
      field :taxes, -> { Internal::Types::Array[Payroc::Types::ProcessingTerminalTaxesItem] }, optional: true, nullable: false
      field :security, -> { Payroc::Types::ProcessingTerminalSecurity }, optional: true, nullable: false
      field :receipt_notifications, -> { Payroc::Types::ProcessingTerminalReceiptNotifications }, optional: true, nullable: false, api_name: "receiptNotifications"
      field :devices, -> { Internal::Types::Array[Payroc::Types::ProcessingTerminalDevicesItem] }, optional: true, nullable: false
    end
  end
end
