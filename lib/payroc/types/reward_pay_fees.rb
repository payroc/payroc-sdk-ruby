# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the fees.
    class RewardPayFees < Internal::Types::Model
      field :monthly_subscription, -> { Integer }, optional: false, nullable: false, api_name: "monthlySubscription"
      field :card_charge_percentage, -> { Integer }, optional: true, nullable: false, api_name: "cardChargePercentage"
      field :merchant_charge_percentage, -> { Integer }, optional: true, nullable: false, api_name: "merchantChargePercentage"
      field :transaction, -> { Integer }, optional: true, nullable: false
      field :tips, -> { Payroc::Types::RewardPayFeesTips }, optional: false, nullable: false
      field :speciality_cards, -> { Payroc::Types::SpecialityCards }, optional: true, nullable: false, api_name: "specialityCards"
    end
  end
end
