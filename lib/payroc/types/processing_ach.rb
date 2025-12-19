# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about Automated Clearing House (ACH) transactions.
    class ProcessingAch < Internal::Types::Model
      field :naics, -> { String }, optional: true, nullable: false
      field :previously_terminated_for_ach, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "previouslyTerminatedForAch"
      field :refunds, -> { Payroc::Types::ProcessingAchRefunds }, optional: false, nullable: false
      field :estimated_monthly_transactions, -> { Integer }, optional: false, nullable: false, api_name: "estimatedMonthlyTransactions"
      field :limits, -> { Payroc::Types::ProcessingAchLimits }, optional: false, nullable: false
      field :transaction_types, -> { Internal::Types::Array[Payroc::Types::ProcessingAchTransactionTypesItem] }, optional: true, nullable: false, api_name: "transactionTypes"
      field :transaction_types_other, -> { String }, optional: true, nullable: false, api_name: "transactionTypesOther"
    end
  end
end
