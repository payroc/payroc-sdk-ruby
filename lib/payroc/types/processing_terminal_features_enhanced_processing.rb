# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains details about level two and level three transactions.
    class ProcessingTerminalFeaturesEnhancedProcessing < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :transaction_data_level, -> { Payroc::Types::ProcessingTerminalFeaturesEnhancedProcessingTransactionDataLevel }, optional: true, nullable: false, api_name: "transactionDataLevel"
      field :shipping_address_mode, -> { Payroc::Types::ProcessingTerminalFeaturesEnhancedProcessingShippingAddressMode }, optional: true, nullable: false, api_name: "shippingAddressMode"
    end
  end
end
