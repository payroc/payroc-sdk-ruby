# frozen_string_literal: true

module Payroc
  module RepeatPayments
    module Subscriptions
      module Types
        class ListSubscriptionsRequest < Internal::Types::Model
          field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
          field :customer_name, -> { String }, optional: true, nullable: false, api_name: "customerName"
          field :last_4, -> { String }, optional: true, nullable: false, api_name: "last4"
          field :payment_plan, -> { String }, optional: true, nullable: false, api_name: "paymentPlan"
          field :frequency, -> { Payroc::RepeatPayments::Subscriptions::Types::ListSubscriptionsRequestFrequency }, optional: true, nullable: false
          field :status, -> { Payroc::RepeatPayments::Subscriptions::Types::ListSubscriptionsRequestStatus }, optional: true, nullable: false
          field :end_date, -> { String }, optional: true, nullable: false, api_name: "endDate"
          field :next_due_date, -> { String }, optional: true, nullable: false, api_name: "nextDueDate"
          field :before, -> { String }, optional: true, nullable: false
          field :after, -> { String }, optional: true, nullable: false
          field :limit, -> { Integer }, optional: true, nullable: false
        end
      end
    end
  end
end
