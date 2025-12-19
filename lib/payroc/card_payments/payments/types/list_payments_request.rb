# frozen_string_literal: true

module Payroc
  module CardPayments
    module Payments
      module Types
        class ListPaymentsRequest < Internal::Types::Model
          field :processing_terminal_id, -> { String }, optional: true, nullable: false, api_name: "processingTerminalId"
          field :order_id, -> { String }, optional: true, nullable: false, api_name: "orderId"
          field :operator, -> { String }, optional: true, nullable: false
          field :cardholder_name, -> { String }, optional: true, nullable: false, api_name: "cardholderName"
          field :first_6, -> { String }, optional: true, nullable: false, api_name: "first6"
          field :last_4, -> { String }, optional: true, nullable: false, api_name: "last4"
          field :tender, -> { Payroc::CardPayments::Payments::Types::ListPaymentsRequestTender }, optional: true, nullable: false
          field :tip_mode, -> { Payroc::CardPayments::Payments::Types::ListPaymentsRequestTipModeItem }, optional: true, nullable: false, api_name: "tipMode"
          field :type, -> { Payroc::CardPayments::Payments::Types::ListPaymentsRequestTypeItem }, optional: true, nullable: false
          field :status, -> { Payroc::CardPayments::Payments::Types::ListPaymentsRequestStatusItem }, optional: true, nullable: false
          field :date_from, -> { String }, optional: true, nullable: false, api_name: "dateFrom"
          field :date_to, -> { String }, optional: true, nullable: false, api_name: "dateTo"
          field :settlement_state, -> { Payroc::CardPayments::Payments::Types::ListPaymentsRequestSettlementState }, optional: true, nullable: false, api_name: "settlementState"
          field :settlement_date, -> { String }, optional: true, nullable: false, api_name: "settlementDate"
          field :payment_link_id, -> { String }, optional: true, nullable: false, api_name: "paymentLinkId"
          field :before, -> { String }, optional: true, nullable: false
          field :after, -> { String }, optional: true, nullable: false
          field :limit, -> { Integer }, optional: true, nullable: false
        end
      end
    end
  end
end
