# frozen_string_literal: true

module Payroc
  module Payments
    module PaymentLinks
      module SharingEvents
        module Types
          class ListSharingEventsRequest < Internal::Types::Model
            field :payment_link_id, -> { String }, optional: false, nullable: false, api_name: "paymentLinkId"
            field :recipient_name, -> { String }, optional: true, nullable: false, api_name: "recipientName"
            field :recipient_email, -> { String }, optional: true, nullable: false, api_name: "recipientEmail"
            field :before, -> { String }, optional: true, nullable: false
            field :after, -> { String }, optional: true, nullable: false
            field :limit, -> { Integer }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
