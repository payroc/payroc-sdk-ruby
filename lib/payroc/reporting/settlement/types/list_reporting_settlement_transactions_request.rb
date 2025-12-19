# frozen_string_literal: true

module Payroc
  module Reporting
    module Settlement
      module Types
        class ListReportingSettlementTransactionsRequest < Internal::Types::Model
          field :before, -> { String }, optional: true, nullable: false
          field :after, -> { String }, optional: true, nullable: false
          field :limit, -> { Integer }, optional: true, nullable: false
          field :date, -> { String }, optional: true, nullable: false
          field :batch_id, -> { Integer }, optional: true, nullable: false, api_name: "batchId"
          field :merchant_id, -> { String }, optional: true, nullable: false, api_name: "merchantId"
          field :transaction_type, -> { Payroc::Reporting::Settlement::Types::ListTransactionsSettlementRequestTransactionType }, optional: true, nullable: false, api_name: "transactionType"
        end
      end
    end
  end
end
