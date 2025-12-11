# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains details about the transaction.
    class Order < Internal::Types::Model
      field :order_id, -> { String }, optional: false, nullable: false, api_name: "orderId"
      field :date_time, -> { String }, optional: true, nullable: false, api_name: "dateTime"
      field :description, -> { String }, optional: true, nullable: false
      field :amount, -> { Integer }, optional: false, nullable: false
      field :currency, -> { Payroc::Types::Currency }, optional: false, nullable: false
    end
  end
end
