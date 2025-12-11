# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the choice rate. We return this only if the value for offered was `true`.
    class ChoiceRate < Internal::Types::Model
      field :applied, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :rate, -> { Integer }, optional: false, nullable: false
      field :amount, -> { Integer }, optional: false, nullable: false
    end
  end
end
