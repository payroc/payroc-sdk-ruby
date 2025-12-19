# frozen_string_literal: true

module Payroc
  module CardPayments
    module Payments
      module Types
        module ListPaymentsRequestTender
          extend Payroc::Internal::Types::Enum

          EBT = "ebt"
          CREDIT_DEBIT = "creditDebit"
        end
      end
    end
  end
end
