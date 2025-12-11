# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about how we process transactions for the account.
    class Processing < Internal::Types::Model
      field :merchant_id, -> { String }, optional: true, nullable: false, api_name: "merchantId"
      field :transaction_amounts, -> { Payroc::Types::ProcessingTransactionAmounts }, optional: false, nullable: false, api_name: "transactionAmounts"
      field :monthly_amounts, -> { Payroc::Types::ProcessingMonthlyAmounts }, optional: false, nullable: false, api_name: "monthlyAmounts"
      field :volume_breakdown, -> { Payroc::Types::ProcessingVolumeBreakdown }, optional: false, nullable: false, api_name: "volumeBreakdown"
      field :is_seasonal, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "isSeasonal"
      field :months_of_operation, -> { Internal::Types::Array[Payroc::Types::ProcessingMonthsOfOperationItem] }, optional: true, nullable: false, api_name: "monthsOfOperation"
      field :ach, -> { Payroc::Types::ProcessingAch }, optional: true, nullable: false
      field :card_acceptance, -> { Payroc::Types::ProcessingCardAcceptance }, optional: true, nullable: false, api_name: "cardAcceptance"
    end
  end
end
