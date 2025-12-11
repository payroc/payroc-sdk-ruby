# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains a tax rate with a short description of the tax rate.
    class ProcessingTerminalTaxesItem < Internal::Types::Model
      field :tax_rate, -> { Integer }, optional: false, nullable: false, api_name: "taxRate"
      field :tax_label, -> { String }, optional: false, nullable: false, api_name: "taxLabel"
    end
  end
end
