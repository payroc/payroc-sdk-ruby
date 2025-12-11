# frozen_string_literal: true

module Payroc
  module Payments
    module Types
      module ListPaymentsRequestTypeItem
        extend Payroc::Internal::Types::Enum

        SALE = "sale"
        PRE_AUTHORIZATION = "preAuthorization"
        PRE_AUTHORIZATION_COMPLETION = "preAuthorizationCompletion"
      end
    end
  end
end
