# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the information about a sharing event that the merchant sent by email.
    class PaymentLinkEmailShareEvent < Internal::Types::Model
      field :sharing_method, -> { Payroc::Types::PaymentLinkEmailShareEventSharingMethod }, optional: false, nullable: false, api_name: "sharingMethod"
      field :sharing_event_id, -> { String }, optional: true, nullable: false, api_name: "sharingEventId"
      field :date_time, -> { String }, optional: true, nullable: false, api_name: "dateTime"
      field :merchant_copy, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "merchantCopy"
      field :message, -> { String }, optional: true, nullable: false
      field :recipients, -> { Internal::Types::Array[Payroc::Types::PaymentLinkEmailRecipient] }, optional: false, nullable: false
    end
  end
end
