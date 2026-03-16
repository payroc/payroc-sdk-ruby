# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about card fees.
    class PricingAgreementUs52ProcessorCard < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :plan_type

      member -> { Payroc::Types::InterchangePlusUs52 }, key: "INTERCHANGE_PLUS"
      member -> { Payroc::Types::InterchangePlusPlusUs52 }, key: "INTERCHANGE_PLUS_PLUS"
      member -> { Payroc::Types::Tiered3 }, key: "TIERED_3"
      member -> { Payroc::Types::Tiered4 }, key: "TIERED_4"
      member -> { Payroc::Types::Tiered6 }, key: "TIERED_6"
      member -> { Payroc::Types::FlatRate }, key: "FLAT_RATE"
      member -> { Payroc::Types::ConsumerChoice }, key: "CONSUMER_CHOICE"
      member -> { Payroc::Types::RewardPayChoice }, key: "REWARD_PAY_CHOICE"
    end
  end
end
