# frozen_string_literal: true

module Payroc
  module Types
    module ThirdPartyThreeDSecureEci
      extend Payroc::Internal::Types::Enum

      FULLY_AUTHENTICATED = "fullyAuthenticated"
      ATTEMPTED_AUTHENTICATION = "attemptedAuthentication"
    end
  end
end
