# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the settings for the solution, including gateway settings, device settings, and application
    # settings.
    class OrderItemSolutionSetup < Internal::Types::Model
      field :timezone, -> { Payroc::Types::SchemasTimezone }, optional: true, nullable: false
      field :industry_template_id, -> { String }, optional: true, nullable: false, api_name: "industryTemplateId"
      field :gateway_settings, -> { Payroc::Types::OrderItemSolutionSetupGatewaySettings }, optional: true, nullable: false, api_name: "gatewaySettings"
      field :application_settings, -> { Payroc::Types::OrderItemSolutionSetupApplicationSettings }, optional: true, nullable: false, api_name: "applicationSettings"
      field :device_settings, -> { Payroc::Types::OrderItemSolutionSetupDeviceSettings }, optional: true, nullable: false, api_name: "deviceSettings"
      field :batch_closure, -> { Payroc::Types::OrderItemSolutionSetupBatchClosure }, optional: true, nullable: false, api_name: "batchClosure"
      field :receipt_notifications, -> { Payroc::Types::OrderItemSolutionSetupReceiptNotifications }, optional: true, nullable: false, api_name: "receiptNotifications"
      field :taxes, -> { Internal::Types::Array[Payroc::Types::OrderItemSolutionSetupTaxesItem] }, optional: true, nullable: false
      field :tips, -> { Payroc::Types::OrderItemSolutionSetupTips }, optional: true, nullable: false
      field :tokenization, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
