# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the fees for card transactions.
    class PricingAgreementUs40ProcessorCard < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :plan_type

      member -> { Payroc::Types::InterchangePlus }, key: "INTERCHANGE_PLUS"
      member -> { Payroc::Types::InterchangePlusTiered3 }, key: "INTERCHANGE_PLUS_TIERED_3"
      member -> { Payroc::Types::Tiered3 }, key: "TIERED_3"
      member -> { Payroc::Types::Tiered4 }, key: "TIERED_4"
      member -> { Payroc::Types::Tiered6 }, key: "TIERED_6"
      member -> { Payroc::Types::FlatRate }, key: "FLAT_RATE"
      member -> { Payroc::Types::ConsumerChoice }, key: "CONSUMER_CHOICE"
      member -> { Payroc::Types::RewardPay }, key: "REWARD_PAY"
      member -> { Payroc::Types::RewardPayChoice }, key: "REWARD_PAY_CHOICE"
    end
  end
end
