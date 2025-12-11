# frozen_string_literal: true

module Payroc
  module Types
    class PaymentPlanBase < Internal::Types::Model
      field :payment_plan_id, -> { String }, optional: false, nullable: false, api_name: "paymentPlanId"
      field :processing_terminal_id, -> { String }, optional: true, nullable: false, api_name: "processingTerminalId"
      field :name, -> { String }, optional: false, nullable: false
      field :description, -> { String }, optional: true, nullable: false
      field :currency, -> { Payroc::Types::Currency }, optional: false, nullable: false
      field :length, -> { Integer }, optional: true, nullable: false
      field :type, -> { Payroc::Types::PaymentPlanBaseType }, optional: false, nullable: false
      field :frequency, -> { Payroc::Types::PaymentPlanBaseFrequency }, optional: false, nullable: false
      field :on_update, -> { Payroc::Types::PaymentPlanBaseOnUpdate }, optional: false, nullable: false, api_name: "onUpdate"
      field :on_delete, -> { Payroc::Types::PaymentPlanBaseOnDelete }, optional: false, nullable: false, api_name: "onDelete"
      field :custom_field_names, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "customFieldNames"
    end
  end
end
