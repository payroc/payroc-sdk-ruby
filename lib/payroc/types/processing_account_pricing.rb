# frozen_string_literal: true

module Payroc
  module Types
    # Object that HATEOAS links to the pricing information that we apply to the processing account.
    class ProcessingAccountPricing < Internal::Types::Model
      field :link, -> { Payroc::Types::ProcessingAccountPricingLink }, optional: true, nullable: false
    end
  end
end
