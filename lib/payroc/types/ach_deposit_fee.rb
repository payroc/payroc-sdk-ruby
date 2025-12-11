# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the ACH deposit fee.
    class AchDepositFee < Internal::Types::Model
      field :association_date, -> { String }, optional: true, nullable: false, api_name: "associationDate"
      field :adjustment_date, -> { String }, optional: true, nullable: false, api_name: "adjustmentDate"
      field :description, -> { String }, optional: true, nullable: false
      field :amount, -> { Integer }, optional: true, nullable: false
      field :merchant, -> { Payroc::Types::MerchantSummary }, optional: true, nullable: false
      field :ach_deposit, -> { Payroc::Types::AchDepositSummary }, optional: true, nullable: false, api_name: "achDeposit"
    end
  end
end
