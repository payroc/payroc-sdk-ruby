# frozen_string_literal: true

module Payroc
  module Payments
    module SecureTokens
      module Types
        # Object that contains information for an authentication check on the customer's payment details using the 3-D
        # Secure protocol.
        class TokenizationRequestThreeDSecure < Internal::Types::Model
          extend Payroc::Internal::Types::Union

          discriminant :type

          member -> { Payroc::Types::GatewayThreeDSecure }, key: "GATEWAY_THREE_D_SECURE"
          member -> { Payroc::Types::ThirdPartyThreeDSecure }, key: "THIRD_PARTY_THREE_D_SECURE"
        end
      end
    end
  end
end
