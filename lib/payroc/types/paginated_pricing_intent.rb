# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about your pricing intents.
    class PaginatedPricingIntent < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Payroc::Types::PricingIntent50] }, optional: true, nullable: false
    end
  end
end
