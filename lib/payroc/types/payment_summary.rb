# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about a payment.
    class PaymentSummary < Internal::Types::Model
      field :payment_id, -> { String }, optional: false, nullable: false, api_name: "paymentId"
      field :date_time, -> { String }, optional: false, nullable: false, api_name: "dateTime"
      field :currency, -> { Payroc::Types::Currency }, optional: false, nullable: false
      field :amount, -> { Integer }, optional: false, nullable: false
      field :status, -> { Payroc::Types::PaymentSummaryStatus }, optional: false, nullable: false
      field :response_code, -> { Payroc::Types::PaymentSummaryResponseCode }, optional: false, nullable: false, api_name: "responseCode"
      field :response_message, -> { String }, optional: true, nullable: false, api_name: "responseMessage"
      field :link, -> { Payroc::Types::Link }, optional: true, nullable: false
    end
  end
end
