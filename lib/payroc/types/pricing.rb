# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains HATEOAS links to the pricing information that we apply to the processing account.
    class Pricing < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :type

      member -> { Payroc::Types::PricingTemplate }, key: "INTENT"
      member -> { Payroc::Types::PricingAgreement }, key: "AGREEMENT"
    end
  end
end
