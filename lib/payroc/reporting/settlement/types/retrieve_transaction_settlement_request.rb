# frozen_string_literal: true

module Payroc
  module Reporting
    module Settlement
      module Types
        class RetrieveTransactionSettlementRequest < Internal::Types::Model
          field :transaction_id, -> { Integer }, optional: false, nullable: false, api_name: "transactionId"
        end
      end
    end
  end
end
