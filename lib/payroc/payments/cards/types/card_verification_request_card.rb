# frozen_string_literal: true

module Payroc
  module Payments
    module Cards
      module Types
        # Object that contains information about the card.
        class CardVerificationRequestCard < Internal::Types::Model
          extend Payroc::Internal::Types::Union

          discriminant :type

          member -> { Payroc::Types::CardPayload }, key: "CARD"
        end
      end
    end
  end
end
