# frozen_string_literal: true

module Payroc
  module Boarding
    module PricingIntents
      module Types
        class ListPricingIntentsRequest < Internal::Types::Model
          field :before, -> { String }, optional: true, nullable: false
          field :after, -> { String }, optional: true, nullable: false
          field :limit, -> { Integer }, optional: true, nullable: false
        end
      end
    end
  end
end
