# frozen_string_literal: true

module Payroc
  module Reporting
    module Settlement
      module Types
        module ListTransactionsSettlementRequestTransactionType
          extend Payroc::Internal::Types::Enum

          CAPTURE = "Capture"
          RETURN = "Return"
        end
      end
    end
  end
end
