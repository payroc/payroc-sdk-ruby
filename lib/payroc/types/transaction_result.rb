# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the transaction response details.
    class TransactionResult < Internal::Types::Model
      field :type, -> { Payroc::Types::TransactionResultType }, optional: true, nullable: false
      field :ebt_type, -> { Payroc::Types::TransactionResultEbtType }, optional: true, nullable: false, api_name: "ebtType"
      field :status, -> { Payroc::Types::TransactionResultStatus }, optional: false, nullable: false
      field :approval_code, -> { String }, optional: true, nullable: false, api_name: "approvalCode"
      field :authorized_amount, -> { Integer }, optional: true, nullable: false, api_name: "authorizedAmount"
      field :currency, -> { Payroc::Types::Currency }, optional: true, nullable: false
      field :response_code, -> { Payroc::Types::TransactionResultResponseCode }, optional: false, nullable: false, api_name: "responseCode"
      field :response_message, -> { String }, optional: true, nullable: false, api_name: "responseMessage"
      field :processor_response_code, -> { String }, optional: true, nullable: false, api_name: "processorResponseCode"
      field :card_scheme_reference_id, -> { String }, optional: true, nullable: false, api_name: "cardSchemeReferenceId"
    end
  end
end
