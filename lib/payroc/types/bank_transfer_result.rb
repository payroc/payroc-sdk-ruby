# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the transaction.
    class BankTransferResult < Internal::Types::Model
      field :type, -> { Payroc::Types::BankTransferResultType }, optional: false, nullable: false
      field :status, -> { Payroc::Types::BankTransferResultStatus }, optional: false, nullable: false
      field :authorized_amount, -> { Integer }, optional: true, nullable: false, api_name: "authorizedAmount"
      field :currency, -> { Payroc::Types::Currency }, optional: false, nullable: false
      field :response_code, -> { String }, optional: false, nullable: false, api_name: "responseCode"
      field :response_message, -> { String }, optional: true, nullable: false, api_name: "responseMessage"
      field :processor_response_code, -> { String }, optional: true, nullable: false, api_name: "processorResponseCode"
    end
  end
end
