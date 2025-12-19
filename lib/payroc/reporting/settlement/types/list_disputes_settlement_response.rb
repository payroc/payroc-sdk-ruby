# frozen_string_literal: true

module Payroc
  module Reporting
    module Settlement
      module Types
        class ListDisputesSettlementResponse < Internal::Types::Model
          field :data, -> { Internal::Types::Array[Payroc::Types::Dispute] }, optional: false, nullable: false
        end
      end
    end
  end
end
