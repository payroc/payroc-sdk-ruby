# frozen_string_literal: true

module Payroc
  module Payments
    module PaymentLinks
      module Types
        module ListPaymentLinksRequestLinkType
          extend Payroc::Internal::Types::Enum

          MULTI_USE = "multiUse"
          SINGLE_USE = "singleUse"
        end
      end
    end
  end
end
