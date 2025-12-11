# frozen_string_literal: true

module Payroc
  module Types
    # Tax that applies to the merchant's transactions.
    class OrderItemSolutionSetupTaxesItem < Internal::Types::Model
      field :tax_rate, -> { Integer }, optional: false, nullable: false, api_name: "taxRate"
      field :tax_label, -> { String }, optional: false, nullable: false, api_name: "taxLabel"
    end
  end
end
