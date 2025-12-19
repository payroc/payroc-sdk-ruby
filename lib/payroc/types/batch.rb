# frozen_string_literal: true

module Payroc
  module Types
    class Batch < Internal::Types::Model
      field :batch_id, -> { Integer }, optional: true, nullable: false, api_name: "batchId"
      field :date, -> { String }, optional: true, nullable: false
      field :created_date, -> { String }, optional: true, nullable: false, api_name: "createdDate"
      field :last_modified_date, -> { String }, optional: true, nullable: false, api_name: "lastModifiedDate"
      field :sale_amount, -> { Integer }, optional: true, nullable: false, api_name: "saleAmount"
      field :held_amount, -> { Integer }, optional: true, nullable: false, api_name: "heldAmount"
      field :return_amount, -> { Integer }, optional: true, nullable: false, api_name: "returnAmount"
      field :transaction_count, -> { Integer }, optional: true, nullable: false, api_name: "transactionCount"
      field :currency, -> { String }, optional: true, nullable: false
      field :merchant, -> { Payroc::Types::MerchantSummary }, optional: true, nullable: false
      field :links, -> { Internal::Types::Array[Payroc::Types::Link] }, optional: true, nullable: false
    end
  end
end
