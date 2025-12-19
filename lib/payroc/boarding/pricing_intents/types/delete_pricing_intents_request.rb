# frozen_string_literal: true

module Payroc
  module Boarding
    module PricingIntents
      module Types
        class DeletePricingIntentsRequest < Internal::Types::Model
          field :pricing_intent_id, -> { String }, optional: false, nullable: false, api_name: "pricingIntentId"
        end
      end
    end
  end
end
