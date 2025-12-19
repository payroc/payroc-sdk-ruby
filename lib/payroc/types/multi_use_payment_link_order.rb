# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the order.
    class MultiUsePaymentLinkOrder < Internal::Types::Model
      field :description, -> { String }, optional: true, nullable: false
      field :charge, -> { Payroc::Types::MultiUsePaymentLinkOrderCharge }, optional: false, nullable: false
    end
  end
end
