# frozen_string_literal: true

module Payroc
  module Types
    # Object that indicates if the terminal can send email receipts, text receipts, or both.
    class OrderItemSolutionSetupReceiptNotifications < Internal::Types::Model
      field :email_receipt, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "emailReceipt"
      field :sms_receipt, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "smsReceipt"
    end
  end
end
