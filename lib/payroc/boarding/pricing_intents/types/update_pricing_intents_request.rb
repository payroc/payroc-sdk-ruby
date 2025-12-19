# frozen_string_literal: true

module Payroc
  module Boarding
    module PricingIntents
      module Types
        class UpdatePricingIntentsRequest < Internal::Types::Model
          field :pricing_intent_id, -> { String }, optional: false, nullable: false, api_name: "pricingIntentId"
          field :body, -> { Payroc::Types::PricingIntent50 }, optional: false, nullable: false
        end
      end
    end
  end
end
