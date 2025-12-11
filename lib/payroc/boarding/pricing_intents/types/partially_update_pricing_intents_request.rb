# frozen_string_literal: true

module Payroc
  module Boarding
    module PricingIntents
      module Types
        class PartiallyUpdatePricingIntentsRequest < Internal::Types::Model
          field :pricing_intent_id, -> { String }, optional: false, nullable: false, api_name: "pricingIntentId"
          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
          field :body, -> { Internal::Types::Array[Payroc::Types::PatchDocument] }, optional: false, nullable: false
        end
      end
    end
  end
end
