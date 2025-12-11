# frozen_string_literal: true

module Payroc
  module Reporting
    module Settlement
      module Types
        class ListTransactionsSettlementResponse < Internal::Types::Model
          field :data, -> { Internal::Types::Array[Payroc::Types::Transaction] }, optional: false, nullable: false
        end
      end
    end
  end
end
