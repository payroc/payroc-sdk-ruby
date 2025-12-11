# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the password settings when running specific transaction types.
    class OrderItemSolutionSetupApplicationSettingsSecurity < Internal::Types::Model
      field :refund_password, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "refundPassword"
      field :keyed_sale_password, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "keyedSalePassword"
      field :reversal_password, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "reversalPassword"
    end
  end
end
