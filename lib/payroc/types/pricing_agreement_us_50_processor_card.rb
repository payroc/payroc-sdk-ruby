# frozen_string_literal: true

module Payroc
  module Types
    # Polymorphic object that contains fees for card transactions.
    #
    # The value of the planType field determines which variant you should use:
    # -	`interchangePlus` - Interchange + pricing
    # -	`interchangePlusPlus` - Interchange pricing with three tiers
    # -	`tiered3` - Three-tiered pricing
    # -	`tiered4` - Four-tiered pricing
    # -	`tiered6` - Six-tiered pricing
    # -	`flatRate` - Flat rate pricing
    # -	`consumerChoice` - ConsumerChoice
    # -	`rewardPayChoice` - RewardPayChoice
    class PricingAgreementUs50ProcessorCard < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :plan_type

      member -> { Payroc::Types::InterchangePlus }, key: "INTERCHANGE_PLUS"
      member -> { Payroc::Types::InterchangePlusPlus }, key: "INTERCHANGE_PLUS_PLUS"
      member -> { Payroc::Types::Tiered3 }, key: "TIERED_3"
      member -> { Payroc::Types::Tiered4 }, key: "TIERED_4"
      member -> { Payroc::Types::Tiered6 }, key: "TIERED_6"
      member -> { Payroc::Types::FlatRate }, key: "FLAT_RATE"
      member -> { Payroc::Types::ConsumerChoice }, key: "CONSUMER_CHOICE"
      member -> { Payroc::Types::RewardPayChoice }, key: "REWARD_PAY_CHOICE"
    end
  end
end
