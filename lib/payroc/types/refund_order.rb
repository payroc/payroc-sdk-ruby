# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the refund.
    class RefundOrder < Internal::Types::Model
      field :order_id, -> { String }, optional: true, nullable: false, api_name: "orderId"
      field :date_time, -> { String }, optional: true, nullable: false, api_name: "dateTime"
      field :description, -> { String }, optional: true, nullable: false
      field :amount, -> { Integer }, optional: true, nullable: false
      field :currency, -> { Payroc::Types::Currency }, optional: true, nullable: false
      field :dcc_offer, -> { Payroc::Types::DccOffer }, optional: true, nullable: false, api_name: "dccOffer"
    end
  end
end
