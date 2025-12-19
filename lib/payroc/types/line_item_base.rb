# frozen_string_literal: true

module Payroc
  module Types
    # List of line items.
    class LineItemBase < Internal::Types::Model
      field :commodity_code, -> { String }, optional: true, nullable: false, api_name: "commodityCode"
      field :product_code, -> { String }, optional: true, nullable: false, api_name: "productCode"
      field :description, -> { String }, optional: true, nullable: false
      field :unit_of_measure, -> { Payroc::Types::UnitOfMeasure }, optional: true, nullable: false, api_name: "unitOfMeasure"
      field :unit_price, -> { Integer }, optional: false, nullable: false, api_name: "unitPrice"
      field :quantity, -> { Integer }, optional: false, nullable: false
      field :discount_rate, -> { Integer }, optional: true, nullable: false, api_name: "discountRate"
    end
  end
end
