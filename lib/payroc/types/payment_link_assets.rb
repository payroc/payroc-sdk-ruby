# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains shareable assets for the payment link.
    class PaymentLinkAssets < Internal::Types::Model
      field :payment_url, -> { String }, optional: false, nullable: false, api_name: "paymentUrl"
      field :payment_button, -> { String }, optional: false, nullable: false, api_name: "paymentButton"
    end
  end
end
