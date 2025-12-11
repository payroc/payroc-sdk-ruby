# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the surcharge.
    class Surcharge < Internal::Types::Model
      field :bypass, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :amount, -> { Integer }, optional: true, nullable: false
      field :percentage, -> { Integer }, optional: true, nullable: false
    end
  end
end
