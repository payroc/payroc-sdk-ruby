# frozen_string_literal: true

module Payroc
  module Types
    module TransactionResultType
      extend Payroc::Internal::Types::Enum

      SALE = "sale"
      REFUND = "refund"
      PRE_AUTHORIZATION = "preAuthorization"
      PRE_AUTHORIZATION_COMPLETION = "preAuthorizationCompletion"
    end
  end
end
