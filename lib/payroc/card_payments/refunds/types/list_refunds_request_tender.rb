# frozen_string_literal: true

module Payroc
  module CardPayments
    module Refunds
      module Types
        module ListRefundsRequestTender
          extend Payroc::Internal::Types::Enum

          EBT = "ebt"
          CREDIT_DEBIT = "creditDebit"
        end
      end
    end
  end
end
