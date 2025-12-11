# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about fees for credit transactions.
    class RewardPayChoiceFeesCredit < Internal::Types::Model
      field :tips, -> { Payroc::Types::RewardPayChoiceFeesCreditTips }, optional: true, nullable: false
      field :card_charge_percentage, -> { Integer }, optional: true, nullable: false, api_name: "cardChargePercentage"
      field :merchant_charge_percentage, -> { Integer }, optional: true, nullable: false, api_name: "merchantChargePercentage"
      field :merchant_charge_per_transaction, -> { Integer }, optional: true, nullable: false, api_name: "merchantChargePerTransaction"
    end
  end
end
