# frozen_string_literal: true

module Payroc
  module Reporting
    module Settlement
      module Types
        class ListDisputesStatusesSettlementRequest < Internal::Types::Model
          field :dispute_id, -> { Integer }, optional: false, nullable: false, api_name: "disputeId"
        end
      end
    end
  end
end
