# frozen_string_literal: true

module Payroc
  module Types
    class RetrievedTax < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :rate, -> { Integer }, optional: false, nullable: false
      field :amount, -> { Integer }, optional: true, nullable: false
    end
  end
end
