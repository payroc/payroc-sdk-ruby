# frozen_string_literal: true

module Payroc
  module Payments
    module PaymentLinks
      module Types
        class PartiallyUpdatePaymentLinksRequest < Internal::Types::Model
          field :payment_link_id, -> { String }, optional: false, nullable: false, api_name: "paymentLinkId"
          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
          field :body, -> { Internal::Types::Array[Payroc::Types::PatchDocument] }, optional: false, nullable: false
        end
      end
    end
  end
end
