# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about transaction limits for the processing account.
    class ProcessingAchLimits < Internal::Types::Model
      field :single_transaction, -> { Integer }, optional: false, nullable: false, api_name: "singleTransaction"
      field :daily_deposit, -> { Integer }, optional: false, nullable: false, api_name: "dailyDeposit"
      field :monthly_deposit, -> { Integer }, optional: false, nullable: false, api_name: "monthlyDeposit"
    end
  end
end
