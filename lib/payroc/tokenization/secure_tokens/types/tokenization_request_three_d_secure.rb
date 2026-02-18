# frozen_string_literal: true

module Payroc
  module Tokenization
    module SecureTokens
      module Types
        # Polymorphic object that contains authentication information from 3-D Secure.
        #
        # The value of the type parameter determines which variant you should use:
        # -	`gatewayThreeDSecure` - Use our gateway to run a 3-D Secure check.
        # -	`thirdPartyThreeDSecure` - Use a third party to run a 3-D Secure check.
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
