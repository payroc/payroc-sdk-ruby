# frozen_string_literal: true

module Payroc
  module Types
    # Tip settings
    class TipProcessingDisabled < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
