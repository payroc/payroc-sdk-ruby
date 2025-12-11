# frozen_string_literal: true

module Payroc
  module Types
    class TaxRate < Internal::Types::Model
      field :type, -> { Payroc::Types::TaxRateType }, optional: false, nullable: false
      field :rate, -> { Integer }, optional: false, nullable: false
      field :name, -> { String }, optional: false, nullable: false
    end
  end
end
