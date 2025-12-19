# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains details about EBT transactions.
    class EbtDisabled < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
