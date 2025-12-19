# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains surcharge information. Our gateway returns this object only if the merchant adds a surcharge
    # to transactions.
    class Surcharging < Internal::Types::Model
      field :allowed, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :amount, -> { Integer }, optional: true, nullable: false
      field :percentage, -> { Integer }, optional: true, nullable: false
      field :disclosure, -> { String }, optional: true, nullable: false
    end
  end
end
