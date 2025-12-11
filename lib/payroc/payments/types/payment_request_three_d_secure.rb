# frozen_string_literal: true

module Payroc
  module Payments
    module Types
      # Object that contains information for an authentication check on the customer's payment details using the 3-D
      # Secure protocol.
      class PaymentRequestThreeDSecure < Internal::Types::Model
        extend Payroc::Internal::Types::Union

        discriminant :service_provider

        member -> { Payroc::Types::GatewayThreeDSecure }, key: "GATEWAY"
        member -> { Payroc::Types::ThirdPartyThreeDSecure }, key: "THIRD_PARTY"
      end
    end
  end
end
