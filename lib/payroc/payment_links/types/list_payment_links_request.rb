# frozen_string_literal: true

module Payroc
  module PaymentLinks
    module Types
      class ListPaymentLinksRequest < Internal::Types::Model
        field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
        field :merchant_reference, -> { String }, optional: true, nullable: false, api_name: "merchantReference"
        field :link_type, -> { Payroc::PaymentLinks::Types::ListPaymentLinksRequestLinkType }, optional: true, nullable: false, api_name: "linkType"
        field :charge_type, -> { Payroc::PaymentLinks::Types::ListPaymentLinksRequestChargeType }, optional: true, nullable: false, api_name: "chargeType"
        field :status, -> { Payroc::PaymentLinks::Types::ListPaymentLinksRequestStatus }, optional: true, nullable: false
        field :recipient_name, -> { String }, optional: true, nullable: false, api_name: "recipientName"
        field :recipient_email, -> { String }, optional: true, nullable: false, api_name: "recipientEmail"
        field :created_on, -> { String }, optional: true, nullable: false, api_name: "createdOn"
        field :expires_on, -> { String }, optional: true, nullable: false, api_name: "expiresOn"
        field :before, -> { String }, optional: true, nullable: false
        field :after, -> { String }, optional: true, nullable: false
        field :limit, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
