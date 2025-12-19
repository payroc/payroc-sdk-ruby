# frozen_string_literal: true

module Payroc
  module Reporting
    module Settlement
      module Types
        class RetrieveBatchSettlementRequest < Internal::Types::Model
          field :batch_id, -> { Integer }, optional: false, nullable: false, api_name: "batchId"
        end
      end
    end
  end
end
