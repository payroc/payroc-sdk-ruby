# frozen_string_literal: true

module Payroc
  module Payments
    module PaymentLinks
      module Types
        class CreatePaymentLinksRequestBody < Internal::Types::Model
          extend Payroc::Internal::Types::Union

          discriminant :type

          member -> { Payroc::Types::MultiUsePaymentLink }, key: "MULTI_USE"
          member -> { Payroc::Types::SingleUsePaymentLink }, key: "SINGLE_USE"
        end
      end
    end
  end
end
