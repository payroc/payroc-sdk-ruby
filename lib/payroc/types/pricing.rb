# frozen_string_literal: true

module Payroc
  module Types
    # Polymorphic object that contains pricing information for the processing account.
    #
    # The value of the type parameter determines which variant you should use:
    # -	`intent` - Use a pricing agreement template.
    # -	`agreement` - Create a new pricing agreement.
    class Pricing < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :type

      member -> { Payroc::Types::PricingTemplate }, key: "INTENT"
      member -> { Payroc::Types::PricingAgreement }, key: "AGREEMENT"
    end
  end
end
