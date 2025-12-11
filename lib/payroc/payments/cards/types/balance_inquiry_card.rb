# frozen_string_literal: true

module Payroc
  module Payments
    module Cards
      module Types
        # Object that contains information about the card.
        class BalanceInquiryCard < Internal::Types::Model
          extend Payroc::Internal::Types::Union

          discriminant :type

          member -> { Payroc::Types::CardPayload }, key: "CARD"
          member -> { Payroc::Types::SingleUseTokenPayload }, key: "SINGLE_USE_TOKEN"
        end
      end
    end
  end
end
