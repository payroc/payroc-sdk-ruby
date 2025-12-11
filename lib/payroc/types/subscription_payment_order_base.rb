# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the initial cost that a customer pays to set up the subscription.
    class SubscriptionPaymentOrderBase < Internal::Types::Model
      field :order_id, -> { String }, optional: true, nullable: false, api_name: "orderId"
      field :amount, -> { Integer }, optional: true, nullable: false
      field :description, -> { String }, optional: true, nullable: false
    end
  end
end
