# frozen_string_literal: true

module Payroc
  module PaymentLinks
    module Types
      class DeactivatePaymentLinksResponse < Internal::Types::Model
        extend Payroc::Internal::Types::Union

        discriminant :type

        member -> { Payroc::Types::MultiUsePaymentLink }, key: "MULTI_USE"
        member -> { Payroc::Types::SingleUsePaymentLink }, key: "SINGLE_USE"
      end
    end
  end
end
