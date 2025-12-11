# frozen_string_literal: true

module Payroc
  module Payments
    module PaymentLinks
      module SharingEvents
        module Types
          class ShareSharingEventsRequest < Internal::Types::Model
            field :payment_link_id, -> { String }, optional: false, nullable: false, api_name: "paymentLinkId"
            field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
            field :body, -> { Payroc::Types::PaymentLinkEmailShareEvent }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
