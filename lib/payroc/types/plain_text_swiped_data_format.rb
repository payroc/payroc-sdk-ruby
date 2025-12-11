# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about plain-text swiped card data.
    class PlainTextSwipedDataFormat < Internal::Types::Model
      field :device, -> { Payroc::Types::Device }, optional: false, nullable: false
      field :track_data, -> { String }, optional: false, nullable: false, api_name: "trackData"
      field :fallback, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :fallback_reason, -> { Payroc::Types::PlainTextSwipedDataFormatFallbackReason }, optional: true, nullable: false, api_name: "fallbackReason"
    end
  end
end
