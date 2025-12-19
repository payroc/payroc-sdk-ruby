# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains summary information about the transaction that the dispute is linked to.
    class TransactionSummary < Internal::Types::Model
      field :transaction_id, -> { Integer }, optional: true, nullable: false, api_name: "transactionId"
      field :type, -> { Payroc::Types::TransactionSummaryType }, optional: true, nullable: false
      field :date, -> { String }, optional: true, nullable: false
      field :entry_method, -> { Payroc::Types::TransactionSummaryEntryMethod }, optional: true, nullable: false, api_name: "entryMethod"
      field :amount, -> { Integer }, optional: true, nullable: false
      field :link, -> { Payroc::Types::Link }, optional: true, nullable: false
    end
  end
end
