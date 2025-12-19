# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the feature settings for the terminal.
    class ProcessingTerminalFeatures < Internal::Types::Model
      field :tips, -> { Payroc::Types::ProcessingTerminalFeaturesTips }, optional: true, nullable: false
      field :enhanced_processing, -> { Payroc::Types::ProcessingTerminalFeaturesEnhancedProcessing }, optional: false, nullable: false, api_name: "enhancedProcessing"
      field :ebt, -> { Payroc::Types::ProcessingTerminalFeaturesEbt }, optional: false, nullable: false
      field :pin_debit_cashback, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "pinDebitCashback"
      field :recurring_payments, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "recurringPayments"
      field :payment_links, -> { Payroc::Types::ProcessingTerminalFeaturesPaymentLinks }, optional: true, nullable: false, api_name: "paymentLinks"
      field :pre_authorizations, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "preAuthorizations"
      field :offline_payments, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "offlinePayments"
    end
  end
end
