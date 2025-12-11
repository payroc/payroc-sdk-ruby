# frozen_string_literal: true

module Payroc
  module Payments
    module BankTransferRefunds
      module Types
        class ListBankTransferRefundsRequest < Internal::Types::Model
          field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
          field :order_id, -> { String }, optional: true, nullable: false, api_name: "orderId"
          field :name_on_account, -> { String }, optional: true, nullable: false, api_name: "nameOnAccount"
          field :last_4, -> { String }, optional: true, nullable: false, api_name: "last4"
          field :type, -> { Payroc::Payments::BankTransferRefunds::Types::ListBankTransferRefundsRequestTypeItem }, optional: true, nullable: false
          field :status, -> { Payroc::Payments::BankTransferRefunds::Types::ListBankTransferRefundsRequestStatusItem }, optional: true, nullable: false
          field :date_from, -> { String }, optional: true, nullable: false, api_name: "dateFrom"
          field :date_to, -> { String }, optional: true, nullable: false, api_name: "dateTo"
          field :settlement_state, -> { Payroc::Payments::BankTransferRefunds::Types::ListBankTransferRefundsRequestSettlementState }, optional: true, nullable: false, api_name: "settlementState"
          field :settlement_date, -> { String }, optional: true, nullable: false, api_name: "settlementDate"
          field :before, -> { String }, optional: true, nullable: false
          field :after, -> { String }, optional: true, nullable: false
          field :limit, -> { Integer }, optional: true, nullable: false
        end
      end
    end
  end
end
