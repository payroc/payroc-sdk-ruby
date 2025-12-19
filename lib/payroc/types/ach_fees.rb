# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains processing fees for ACH transactions.
    class AchFees < Internal::Types::Model
      field :transaction, -> { Integer }, optional: false, nullable: false
      field :batch, -> { Integer }, optional: false, nullable: false
      field :returns, -> { Integer }, optional: false, nullable: false
      field :unauthorized_return, -> { Integer }, optional: false, nullable: false, api_name: "unauthorizedReturn"
      field :statement, -> { Integer }, optional: false, nullable: false
      field :monthly_minimum, -> { Integer }, optional: false, nullable: false, api_name: "monthlyMinimum"
      field :account_verification, -> { Integer }, optional: false, nullable: false, api_name: "accountVerification"
      field :discount_rate_under_10000, -> { Integer }, optional: false, nullable: false, api_name: "discountRateUnder10000"
      field :discount_rate_above_10000, -> { Integer }, optional: false, nullable: false, api_name: "discountRateAbove10000"
    end
  end
end
