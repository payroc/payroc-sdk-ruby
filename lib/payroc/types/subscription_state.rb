# frozen_string_literal: true

module Payroc
  module Types
    # A snapshot of the subscription's current state.
    class SubscriptionState < Internal::Types::Model
      field :status, -> { Payroc::Types::SubscriptionStateStatus }, optional: false, nullable: false
      field :next_due_date, -> { String }, optional: true, nullable: false, api_name: "nextDueDate"
      field :paid_invoices, -> { Integer }, optional: false, nullable: false, api_name: "paidInvoices"
      field :outstanding_invoices, -> { Integer }, optional: true, nullable: false, api_name: "outstandingInvoices"
    end
  end
end
