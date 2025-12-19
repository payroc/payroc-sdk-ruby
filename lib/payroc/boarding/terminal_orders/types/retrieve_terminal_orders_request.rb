# frozen_string_literal: true

module Payroc
  module Boarding
    module TerminalOrders
      module Types
        class RetrieveTerminalOrdersRequest < Internal::Types::Model
          field :terminal_order_id, -> { String }, optional: false, nullable: false, api_name: "terminalOrderId"
        end
      end
    end
  end
end
