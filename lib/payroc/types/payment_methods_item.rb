# frozen_string_literal: true

module Payroc
  module Types
    class PaymentMethodsItem < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :type

      member -> { Payroc::Types::PaymentMethodAch }, key: "ACH"
    end
  end
end
