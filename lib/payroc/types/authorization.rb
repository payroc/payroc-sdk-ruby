# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the authorization.
    class Authorization < Internal::Types::Model
      field :authorization_id, -> { Integer }, optional: true, nullable: false, api_name: "authorizationId"
      field :created_date, -> { String }, optional: true, nullable: false, api_name: "createdDate"
      field :last_modified_date, -> { String }, optional: true, nullable: false, api_name: "lastModifiedDate"
      field :authorization_response, -> { Payroc::Types::AuthorizationAuthorizationResponse }, optional: true, nullable: false, api_name: "authorizationResponse"
      field :preauthorization_request_amount, -> { Integer }, optional: true, nullable: false, api_name: "preauthorizationRequestAmount"
      field :currency, -> { String }, optional: true, nullable: false
      field :batch, -> { Payroc::Types::BatchSummary }, optional: true, nullable: false
      field :card, -> { Payroc::Types::CardSummary }, optional: true, nullable: false
      field :merchant, -> { Payroc::Types::MerchantSummary }, optional: true, nullable: false
      field :transaction, -> { Payroc::Types::TransactionSummary }, optional: true, nullable: false
    end
  end
end
