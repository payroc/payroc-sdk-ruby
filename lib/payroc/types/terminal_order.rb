# frozen_string_literal: true

module Payroc
  module Types
    class TerminalOrder < Internal::Types::Model
      field :terminal_order_id, -> { String }, optional: false, nullable: false, api_name: "terminalOrderId"
      field :status, -> { Payroc::Types::TerminalOrderStatus }, optional: false, nullable: false
      field :training_provider, -> { Payroc::Types::TerminalOrderTrainingProvider }, optional: true, nullable: false, api_name: "trainingProvider"
      field :shipping, -> { Payroc::Types::TerminalOrderShipping }, optional: true, nullable: false
      field :order_items, -> { Internal::Types::Array[Payroc::Types::TerminalOrderOrderItemsItem] }, optional: false, nullable: false, api_name: "orderItems"
      field :created_date, -> { String }, optional: true, nullable: false, api_name: "createdDate"
      field :last_modified_date, -> { String }, optional: true, nullable: false, api_name: "lastModifiedDate"
    end
  end
end
