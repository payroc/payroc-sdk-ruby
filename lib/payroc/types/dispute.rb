# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the dispute.
    class Dispute < Internal::Types::Model
      field :dispute_id, -> { Integer }, optional: true, nullable: false, api_name: "disputeId"
      field :dispute_type, -> { Payroc::Types::DisputeDisputeType }, optional: true, nullable: false, api_name: "disputeType"
      field :current_status, -> { Payroc::Types::DisputeCurrentStatus }, optional: true, nullable: false, api_name: "currentStatus"
      field :created_date, -> { String }, optional: true, nullable: false, api_name: "createdDate"
      field :last_modified_date, -> { String }, optional: true, nullable: false, api_name: "lastModifiedDate"
      field :received_date, -> { String }, optional: true, nullable: false, api_name: "receivedDate"
      field :description, -> { String }, optional: true, nullable: false
      field :reference_number, -> { String }, optional: true, nullable: false, api_name: "referenceNumber"
      field :dispute_amount, -> { Integer }, optional: true, nullable: false, api_name: "disputeAmount"
      field :fee_amount, -> { Integer }, optional: true, nullable: false, api_name: "feeAmount"
      field :first_dispute, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "firstDispute"
      field :authorization_code, -> { String }, optional: true, nullable: false, api_name: "authorizationCode"
      field :currency, -> { String }, optional: true, nullable: false
      field :card, -> { Payroc::Types::CardSummary }, optional: true, nullable: false
      field :merchant, -> { Payroc::Types::MerchantSummary }, optional: true, nullable: false
      field :transaction, -> { Payroc::Types::TransactionSummary }, optional: true, nullable: false
    end
  end
end
