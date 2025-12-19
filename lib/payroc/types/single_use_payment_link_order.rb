# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the order.
    class SingleUsePaymentLinkOrder < Internal::Types::Model
      field :order_id, -> { String }, optional: false, nullable: false, api_name: "orderId"
      field :description, -> { String }, optional: true, nullable: false
      field :charge, -> { Payroc::Types::SingleUsePaymentLinkOrderCharge }, optional: false, nullable: false
    end
  end
end
