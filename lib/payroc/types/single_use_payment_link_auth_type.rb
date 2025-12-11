# frozen_string_literal: true

module Payroc
  module Types
    module SingleUsePaymentLinkAuthType
      extend Payroc::Internal::Types::Enum

      SALE = "sale"
      PRE_AUTHORIZATION = "preAuthorization"
    end
  end
end
