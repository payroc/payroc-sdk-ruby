# frozen_string_literal: true

module Payroc
  module Types
    module MultiUsePaymentLinkAuthType
      extend Payroc::Internal::Types::Enum

      SALE = "sale"
      PRE_AUTHORIZATION = "preAuthorization"
    end
  end
end
