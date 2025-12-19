# frozen_string_literal: true

module Payroc
  module PaymentLinks
    module Types
      class DeactivatePaymentLinksRequest < Internal::Types::Model
        field :payment_link_id, -> { String }, optional: false, nullable: false, api_name: "paymentLinkId"
      end
    end
  end
end
