# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the ACH deposit.
    class AchDeposit < Internal::Types::Model
      field :ach_deposit_id, -> { Integer }, optional: true, nullable: false, api_name: "achDepositId"
      field :association_date, -> { String }, optional: true, nullable: false, api_name: "associationDate"
      field :ach_date, -> { String }, optional: true, nullable: false, api_name: "achDate"
      field :payment_date, -> { String }, optional: true, nullable: false, api_name: "paymentDate"
      field :transactions, -> { Integer }, optional: true, nullable: false
      field :sales, -> { Integer }, optional: true, nullable: false
      field :returns, -> { Integer }, optional: true, nullable: false
      field :daily_fees, -> { Integer }, optional: true, nullable: false, api_name: "dailyFees"
      field :held_sales, -> { Integer }, optional: true, nullable: false, api_name: "heldSales"
      field :ach_adjustment, -> { Integer }, optional: true, nullable: false, api_name: "achAdjustment"
      field :holdback, -> { Integer }, optional: true, nullable: false
      field :reserve_release, -> { Integer }, optional: true, nullable: false, api_name: "reserveRelease"
      field :net_amount, -> { Integer }, optional: true, nullable: false, api_name: "netAmount"
      field :merchant, -> { Payroc::Types::MerchantSummary }, optional: true, nullable: false
      field :links, -> { Internal::Types::Array[Payroc::Types::Link] }, optional: true, nullable: false
    end
  end
end
