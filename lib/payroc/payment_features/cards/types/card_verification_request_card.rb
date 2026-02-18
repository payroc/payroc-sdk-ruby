# frozen_string_literal: true

module Payroc
  module PaymentFeatures
    module Cards
      module Types
        # Polymorphic object that contains payment details.
        class CardVerificationRequestCard < Internal::Types::Model
          extend Payroc::Internal::Types::Union

          discriminant :type

          member -> { Payroc::Types::CardPayload }, key: "CARD"
        end
      end
    end
  end
end
