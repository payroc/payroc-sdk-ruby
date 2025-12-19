# frozen_string_literal: true

module Payroc
  module Types
    class PricingTemplate < Internal::Types::Model
      field :pricing_intent_id, -> { String }, optional: false, nullable: false, api_name: "pricingIntentId"
    end
  end
end
