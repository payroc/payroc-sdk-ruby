# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the transaction.
    class Transaction < Internal::Types::Model
      field :transaction_id, -> { Integer }, optional: true, nullable: false, api_name: "transactionId"
      field :type, -> { Payroc::Types::TransactionType }, optional: true, nullable: false
      field :date, -> { String }, optional: true, nullable: false
      field :amount, -> { Integer }, optional: true, nullable: false
      field :entry_method, -> { Payroc::Types::TransactionEntryMethod }, optional: true, nullable: false, api_name: "entryMethod"
      field :created_date, -> { String }, optional: true, nullable: false, api_name: "createdDate"
      field :last_modified_date, -> { String }, optional: true, nullable: false, api_name: "lastModifiedDate"
      field :status, -> { Payroc::Types::TransactionStatus }, optional: true, nullable: false
      field :cashback_amount, -> { Integer }, optional: true, nullable: false, api_name: "cashbackAmount"
      field :interchange, -> { Payroc::Types::TransactionInterchange }, optional: true, nullable: false
      field :currency, -> { String }, optional: true, nullable: false
      field :merchant, -> { Payroc::Types::MerchantSummary }, optional: true, nullable: false
      field :settled, -> { Payroc::Types::SettledSummary }, optional: true, nullable: false
      field :batch, -> { Payroc::Types::BatchSummary }, optional: true, nullable: false
      field :card, -> { Payroc::Types::CardSummary }, optional: true, nullable: false
      field :authorization, -> { Payroc::Types::AuthorizationSummary }, optional: true, nullable: false
    end
  end
end
