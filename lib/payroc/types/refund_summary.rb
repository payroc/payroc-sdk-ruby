# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about a refund.
    class RefundSummary < Internal::Types::Model
      field :refund_id, -> { String }, optional: false, nullable: false, api_name: "refundId"
      field :date_time, -> { String }, optional: false, nullable: false, api_name: "dateTime"
      field :currency, -> { Payroc::Types::Currency }, optional: false, nullable: false
      field :amount, -> { Integer }, optional: false, nullable: false
      field :status, -> { Payroc::Types::RefundSummaryStatus }, optional: false, nullable: false
      field :response_code, -> { Payroc::Types::RefundSummaryResponseCode }, optional: false, nullable: false, api_name: "responseCode"
      field :response_message, -> { String }, optional: false, nullable: false, api_name: "responseMessage"
      field :link, -> { Payroc::Types::Link }, optional: true, nullable: false
    end
  end
end
