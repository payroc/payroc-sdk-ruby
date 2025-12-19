# frozen_string_literal: true

module Payroc
  module Types
    # Array of links related to your order items.
    class Links < Internal::Types::Model
      field :links, -> { Internal::Types::Array[Payroc::Types::ProcessingTerminalSummary] }, optional: true, nullable: false
    end
  end
end
