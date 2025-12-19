# frozen_string_literal: true

module Payroc
  module Types
    class OrderItem < Internal::Types::Model
      field :type, -> { Payroc::Types::OrderItemType }, optional: false, nullable: false
      field :solution_template_id, -> { String }, optional: false, nullable: false, api_name: "solutionTemplateId"
      field :solution_quantity, -> { Integer }, optional: true, nullable: false, api_name: "solutionQuantity"
      field :device_condition, -> { Payroc::Types::OrderItemDeviceCondition }, optional: true, nullable: false, api_name: "deviceCondition"
      field :solution_setup, -> { Payroc::Types::OrderItemSolutionSetup }, optional: true, nullable: false, api_name: "solutionSetup"
    end
  end
end
