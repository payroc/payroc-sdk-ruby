# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the tip amount of a transaction.
    class BreakdownAdjustment < Internal::Types::Model
      field :tip, -> { Payroc::Types::Tip }, optional: true, nullable: false
    end
  end
end
