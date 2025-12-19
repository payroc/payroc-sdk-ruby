# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the card's bank identification number (BIN).
    class CardBinPayload < Internal::Types::Model
      field :bin, -> { String }, optional: false, nullable: false
    end
  end
end
