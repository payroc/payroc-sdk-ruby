# frozen_string_literal: true

module Payroc
  module Tokenization
    module SingleUseTokens
      module Types
        # Object that contains information about the payment method to tokenize.
        class SingleUseTokenRequestSource < Internal::Types::Model
          extend Payroc::Internal::Types::Union

          discriminant :type

          member -> { Payroc::Types::AchPayload }, key: "ACH"
          member -> { Payroc::Types::PadPayload }, key: "PAD"
          member -> { Payroc::Types::CardPayload }, key: "CARD"
        end
      end
    end
  end
end
