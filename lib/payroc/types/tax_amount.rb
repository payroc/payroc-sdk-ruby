# frozen_string_literal: true

module Payroc
  module Types
    class TaxAmount < Internal::Types::Model
      field :amount, -> { Integer }, optional: false, nullable: false
      field :name, -> { String }, optional: false, nullable: false
    end
  end
end
