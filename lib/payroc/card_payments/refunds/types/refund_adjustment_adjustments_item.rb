# frozen_string_literal: true

module Payroc
  module CardPayments
    module Refunds
      module Types
        class RefundAdjustmentAdjustmentsItem < Internal::Types::Model
          extend Payroc::Internal::Types::Union

          discriminant :type

          member -> { Payroc::Types::StatusAdjustment }, key: "STATUS"
          member -> { Payroc::Types::CustomerAdjustment }, key: "CUSTOMER"
        end
      end
    end
  end
end
