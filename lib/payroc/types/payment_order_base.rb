# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the payment.
    class PaymentOrderBase < Internal::Types::Model
      field :order_id, -> { String }, optional: true, nullable: false, api_name: "orderId"
      field :date_time, -> { String }, optional: true, nullable: false, api_name: "dateTime"
      field :description, -> { String }, optional: true, nullable: false
      field :amount, -> { Integer }, optional: true, nullable: false
      field :currency, -> { Payroc::Types::Currency }, optional: true, nullable: false
      field :dcc_offer, -> { Payroc::Types::DccOffer }, optional: true, nullable: false, api_name: "dccOffer"
      field :standing_instructions, -> { Payroc::Types::StandingInstructions }, optional: true, nullable: false, api_name: "standingInstructions"
    end
  end
end
