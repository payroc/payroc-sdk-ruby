# frozen_string_literal: true

module Payroc
  module Payments
    module Types
      class PaymentAdjustmentAdjustmentsItem < Internal::Types::Model
        extend Payroc::Internal::Types::Union

        discriminant :type

        member -> { Payroc::Types::OrderAdjustment }, key: "ORDER"
        member -> { Payroc::Types::StatusAdjustment }, key: "STATUS"
        member -> { Payroc::Types::CustomerAdjustment }, key: "CUSTOMER"
        member -> { Payroc::Types::SignatureAdjustment }, key: "SIGNATURE"
      end
    end
  end
end
