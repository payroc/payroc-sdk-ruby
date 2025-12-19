# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about a return.
    class BankTransferReturnSummary < Internal::Types::Model
      field :payment_id, -> { String }, optional: false, nullable: false, api_name: "paymentId"
      field :date, -> { String }, optional: false, nullable: false
      field :return_code, -> { String }, optional: false, nullable: false, api_name: "returnCode"
      field :return_reason, -> { String }, optional: false, nullable: false, api_name: "returnReason"
      field :represented, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :link, -> { Payroc::Types::Link }, optional: true, nullable: false
    end
  end
end
