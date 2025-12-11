# frozen_string_literal: true

module Payroc
  module Payments
    module BankTransferPayments
      module Types
        class ListBankTransferPaymentsRequest < Internal::Types::Model
          field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
          field :order_id, -> { String }, optional: true, nullable: false, api_name: "orderId"
          field :name_on_account, -> { String }, optional: true, nullable: false, api_name: "nameOnAccount"
          field :last_4, -> { String }, optional: true, nullable: false, api_name: "last4"
          field :type, -> { Payroc::Payments::BankTransferPayments::Types::ListBankTransferPaymentsRequestTypeItem }, optional: true, nullable: false
          field :status, -> { Payroc::Payments::BankTransferPayments::Types::ListBankTransferPaymentsRequestStatusItem }, optional: true, nullable: false
          field :date_from, -> { String }, optional: true, nullable: false, api_name: "dateFrom"
          field :date_to, -> { String }, optional: true, nullable: false, api_name: "dateTo"
          field :settlement_state, -> { Payroc::Payments::BankTransferPayments::Types::ListBankTransferPaymentsRequestSettlementState }, optional: true, nullable: false, api_name: "settlementState"
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
