# frozen_string_literal: true

module Payroc
  module Types
    class CommonFunding < Internal::Types::Model
      field :status, -> { Payroc::Types::CommonFundingStatus }, optional: true, nullable: false
      field :funding_schedule, -> { Payroc::Types::CommonFundingFundingSchedule }, optional: true, nullable: false, api_name: "fundingSchedule"
      field :accelerated_funding_fee, -> { Integer }, optional: true, nullable: false, api_name: "acceleratedFundingFee"
      field :daily_discount, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "dailyDiscount"
    end
  end
end
