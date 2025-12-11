# frozen_string_literal: true

module Payroc
  module Boarding
    module PricingIntents
      module Types
        class CreatePricingIntentsRequest < Internal::Types::Model
          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
          field :body, -> { Payroc::Types::PricingIntent50 }, optional: false, nullable: false
        end
      end
    end
  end
end
