# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the tip.
    class Tip < Internal::Types::Model
      field :type, -> { Payroc::Types::TipType }, optional: false, nullable: false
      field :mode, -> { Payroc::Types::TipMode }, optional: true, nullable: false
      field :amount, -> { Integer }, optional: true, nullable: false
      field :percentage, -> { Integer }, optional: true, nullable: false
    end
  end
end
