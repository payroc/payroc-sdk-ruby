# frozen_string_literal: true

module Payroc
  module CardPayments
    module Payments
      module Types
        # Polymorphic object that contains authentication information from 3-D Secure.
        #
        # The value of the serviceProvider parameter determines which variant you should use:
        # -	`gateway` - Use our gateway to run a 3-D Secure check.
        # -	`thirdParty` - Use a third party to run a 3-D Secure check.
        class PaymentRequestThreeDSecure < Internal::Types::Model
          extend Payroc::Internal::Types::Union

          discriminant :service_provider

          member -> { Payroc::Types::GatewayThreeDSecure }, key: "GATEWAY"
          member -> { Payroc::Types::ThirdPartyThreeDSecure }, key: "THIRD_PARTY"
        end
      end
    end
  end
end
