# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the tip options for transactions ran on the terminal.
    class OrderItemSolutionSetupTips < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
