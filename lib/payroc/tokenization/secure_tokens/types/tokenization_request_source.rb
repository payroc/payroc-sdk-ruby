# frozen_string_literal: true

module Payroc
  module Tokenization
    module SecureTokens
      module Types
        # Object that contains information about the payment method to tokenize.
        class TokenizationRequestSource < Internal::Types::Model
          extend Payroc::Internal::Types::Union

          discriminant :type

          member -> { Payroc::Types::AchPayload }, key: "ACH"
          member -> { Payroc::Types::PadPayload }, key: "PAD"
          member -> { Payroc::Types::CardPayload }, key: "CARD"
          member -> { Payroc::Types::SingleUseTokenPayload }, key: "SINGLE_USE_TOKEN"
        end
      end
    end
  end
end
